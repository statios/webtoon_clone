//
//  WebtoonListViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa
import Resolver
import UIKit

final class WebtoonListViewModel: BaseViewModel {
  @Injected var webtoonInteractor: WebtoonInteractable
  var weekday: Int?
  
  struct Event {
    let onAppear: Observable<Void>
  }
  
  struct State {
    let webtoons: Driver<[Webtoon]>
  }
}

extension WebtoonListViewModel {
  func reduce(event: Event) -> State {
    let webtooonsReqeust = requestWebtoons(trigger: event.onAppear.take(1))
    let webtooonsResponse = webtooonsReqeust.filter { $0.isSuccess }.compactMap { $0.data }
//    let webtooonsFailure = webtooonsReqeust.filter { !$0.isSuccess }.compactMap { $0.message }
    return State(
      webtoons: webtooonsResponse.asDriver(onErrorJustReturn: [])
    )
  }
}

extension WebtoonListViewModel {
  private func requestWebtoons(trigger: Observable<Void>)
  -> Observable<WebtoonResponse<[Webtoon]>> {
    trigger
      .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
      .compactMap { [weak self] in self?.weekday }
      .flatMap { [weak self] weekday -> Single<WebtoonResponse<[Webtoon]>> in
        guard let `self` = self else { return .never() }
        return self.webtoonInteractor.requestWebtoonList(weekday)
      }.observeOn(MainScheduler.instance).share()
  }
}
