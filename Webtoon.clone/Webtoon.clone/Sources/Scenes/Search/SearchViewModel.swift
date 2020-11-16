//
//  SearchViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import RxSwift
import RxCocoa
import Resolver

final class SearchViewModel: BaseViewModel {
  @Injected var searchInteractor: SearchInteractable
  
  struct Event {
    let tapCancel: Observable<Void>
    let didAppear: Observable<Void>
    let tapSearch: Observable<Void>
    let changeText: Observable<String>
  }
  
  struct State {
    let pop: Driver<Void>
    let focusSearch: Driver<Void>
  }
}

extension SearchViewModel {
  func reduce(event: Event) -> State {
    event.tapSearch
      .withLatestFrom(event.changeText)
      .do(onNext: { [weak self] in self?.searchInteractor.addSearchHistory($0) })
      
    
    return State(
      pop: event.tapCancel.asDriver(),
      focusSearch: event.didAppear.asDriver()
    )
  }
}
