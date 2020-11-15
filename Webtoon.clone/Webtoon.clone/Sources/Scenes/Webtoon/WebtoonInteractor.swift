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
  func requestWebtoonList(_ weekday: Int) -> Single<WebtoonResponse<[Webtoon]>>
}

final class WebtoonInteractor: BaseInteractor, WebtoonInteractable {
  @Injected var webtoonService: WebtoonServiceType
  
  func requestWebtoonList(_ weekday: Int) -> Single<WebtoonResponse<[Webtoon]>> {
    return webtoonService.request(to: .webtoonList(weekday: weekday), type: [Webtoon].self)
  }
}
