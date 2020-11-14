//
//  SplashInteractor.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Resolver
import RxCocoa
import RxSwift

protocol SplashInteractable {
  var webtoonService: WebtoonServiceType { get set }
  func requestSplash() -> Single<WebtoonResponse<Empty>>
}

class SplashInteractor: BaseInteractor, SplashInteractable {
  @Injected var webtoonService: WebtoonServiceType
  
  func requestSplash() -> Single<WebtoonResponse<Empty>> {
    return webtoonService.request(to: .splash, type: Empty.self)
  }
}
