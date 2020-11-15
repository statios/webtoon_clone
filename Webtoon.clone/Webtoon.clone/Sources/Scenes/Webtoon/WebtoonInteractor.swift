//
//  ListInteractor.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Resolver
import RxCocoa
import RxSwift

protocol WebtoonInteractable {
  func requestWebtoonList() -> Single<WebtoonResponse<[Webtoon]>>
  var currentPage: BehaviorRelay<Int> { get }
}

final class WebtoonInteractor: BaseInteractor, WebtoonInteractable {
  @Injected var webtoonService: WebtoonServiceType
  
  var currentPage = BehaviorRelay<Int>(value: 0)
  
  func requestWebtoonList() -> Single<WebtoonResponse<[Webtoon]>> {
    return webtoonService.request(to: .webtoonList(weekday: currentPage.value), type: [Webtoon].self)
  }
}
