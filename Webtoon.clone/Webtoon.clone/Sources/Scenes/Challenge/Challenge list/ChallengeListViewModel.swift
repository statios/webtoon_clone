//
//  ChallengeListViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import RxSwift
import RxCocoa
import Resolver

final class ChallengeListViewModel: BaseViewModel {
  @Injected var challengeInteractor: ChallengeInteractable
  var category: String?
  
  struct Event {
    let onAppear: Observable<Void>
  }
  
  struct State {
    let challenges: Driver<[Challenge]>
  }
}

extension ChallengeListViewModel {
  func reduce(event: Event) -> State {
    let challengesReqeust = requestChallenges(trigger: event.onAppear.take(1))
    let challengesResponse = challengesReqeust.filter { $0.isSuccess }.compactMap { $0.data }
//    let challengesFailure = webtooonsReqeust.filter { !$0.isSuccess }.compactMap { $0.message }
    return State(
      challenges: challengesResponse.asDriver(onErrorJustReturn: [])
    )
  }
}

extension ChallengeListViewModel {
  private func requestChallenges(trigger: Observable<Void>)
  -> Observable<WebtoonResponse<[Challenge]>> {
    trigger
      .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
      .compactMap { [weak self] in self?.category }
      .flatMap { [weak self] category -> Single<WebtoonResponse<[Challenge]>> in
        guard let `self` = self else { return .never() }
        return self.challengeInteractor.requestChallengeList(category)
      }.observeOn(MainScheduler.instance).share()
  }
}
