//
//  ChallengeInteractor.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Resolver
import RxCocoa
import RxSwift

protocol ChallengeInteractable {
  func requestChallengeList(_ cateogry: String) -> Single<WebtoonResponse<[Challenge]>>
}

final class ChallengeInteractor: BaseInteractor, ChallengeInteractable {
  @Injected var webtoonService: WebtoonServiceType
  
  func requestChallengeList(_ cateogry: String) -> Single<WebtoonResponse<[Challenge]>> {
    return webtoonService.request(to: .challengeList(category: cateogry), type: [Challenge].self)
  }
}

