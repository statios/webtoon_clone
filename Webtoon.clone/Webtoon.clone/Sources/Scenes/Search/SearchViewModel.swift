//
//  SearchViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import RxSwift
import RxCocoa
import Resolver
import UIKit

final class SearchViewModel: BaseViewModel {
  @Injected var searchInteractor: SearchInteractable
  
  struct Event {
    let tapCancel: Observable<Void>
    let didAppear: Observable<Void>
    let tapSearch: Observable<Void>
    let didChangedText: Observable<String>
    let didBeganEditing: Observable<Void>
    let didEndEditing: Observable<Void>
    let tapCell: Observable<IndexPath>
  }
  
  struct State {
    let pop: Driver<Void>
    let focusSearch: Driver<Bool>
    let historyIsHidden: Driver<Bool>
    let searchHistory: Driver<[String]>
    let isEmptyResult: Driver<Bool>
  }
  
  //Cell Event
  let deleteHistory = PublishRelay<Int>()
}

extension SearchViewModel {
  func reduce(event: Event) -> State {
    let historyIsHidden = getHistoryIsHidden(show: event.didBeganEditing, hide: event.didEndEditing)
    let focusSearch = Observable.merge(event.didAppear.map { true },
                                       event.tapSearch.map { false },
                                       event.tapCell.map { _ in false })
    let searchHistoryTriggers = getSearchHistoryTrigger(didBeganEditing: event.didBeganEditing,
                                                        deleteHistory: deleteHistory.asObservable())
    let searchHistory = getSearchHistory(trigger: searchHistoryTriggers)
    
    let searchByTapCell = event.tapCell.map { $0.row }.withLatestFrom(searchHistory) { $1[$0] }
    let searchByTapReturn = event.tapSearch.withLatestFrom(event.didChangedText)
    let searchRequest = requestSearch(trigger: Observable.merge(searchByTapCell, searchByTapReturn))
    let searchResponse = searchRequest.filter { $0.isSuccess }.compactMap { $0.data }
//    let searchFailure = searchRequest.filter { !$0.isSuccess }.compactMap { $0.message}
    let isEmptyResult = searchResponse.map { $0.isEmpty }
    
    return State(
      pop: event.tapCancel.asDriver(),
      focusSearch: focusSearch.asDriver(onErrorJustReturn: false),
      historyIsHidden: historyIsHidden.asDriver(onErrorJustReturn: false),
      searchHistory: searchHistory.asDriver(onErrorJustReturn: []),
      isEmptyResult: isEmptyResult.asDriver(onErrorJustReturn: true)
    )
  }
}

extension SearchViewModel {
  private func requestSearch(
    trigger keyword: Observable<String>)
  -> Observable<WebtoonResponse<[Webtoon]>> {
    keyword
      .do(onNext: { [weak self] in self?.searchInteractor.addSearchHistory($0) })
      .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
      .flatMap { [weak self] keyword -> Single<WebtoonResponse<[Webtoon]>> in
        guard let `self` = self else { return .never() }
        return self.searchInteractor.requestSearch(keyword)
      }.observeOn(MainScheduler.instance).share()
  }
  private func getHistoryIsHidden(
    show: Observable<Void>,
    hide: Observable<Void>)
  -> Observable<Bool> {
    return Observable.merge(show.map { false }, hide.map { true })
  }
  private func getSearchHistory(
    trigger: Observable<Void>)
  -> Observable<[String]> {
    trigger
      .compactMap { [weak self] in self?.searchInteractor.getSearchHistory() }
  }
  private func getSearchHistoryTrigger(
    didBeganEditing: Observable<Void>,
    deleteHistory: Observable<Int>)
  -> Observable<Void> {
    let deleteHistoryWithDo = deleteHistory
      .do(onNext: { [weak self] in self?.searchInteractor.removeSearchHistory($0) })
      .void().share()
    return Observable.merge(didBeganEditing, deleteHistoryWithDo)
  }
}
