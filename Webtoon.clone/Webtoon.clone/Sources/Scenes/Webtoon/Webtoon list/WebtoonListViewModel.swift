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
  
  struct Event {
    let onAppear: Observable<Void>
  }
  
  struct State {
    let webtoons: Driver<[Webtoon]>
  }
}

extension WebtoonListViewModel {
  func reduce(event: Event) -> State {
    
    let webtooonsReqeust = event.onAppear.take(1)
      .flatMapLatest { [weak self] _ -> Single<WebtoonResponse<[Webtoon]>> in
        guard let `self` = self else { return .never() }
        return self.webtoonInteractor.requestWebtoonList()
      }.share()
    let webtooonsResponse = webtooonsReqeust.filter { $0.isSuccess }.compactMap { $0.data }
    return State(
      webtoons: webtooonsResponse.asDriver(onErrorJustReturn: [])
    )
  }
}

extension WebtoonListViewModel {
}
