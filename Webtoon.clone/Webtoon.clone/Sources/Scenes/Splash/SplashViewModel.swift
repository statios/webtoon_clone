//
//  SplashViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa
import Resolver

class SplashViewModel: BaseViewModel {
  
  @Injected var splashInteractor: SplashInteractable
  
  struct Event {
    let onAppear: Observable<Void>
  }
  
  struct State {
    let present: Driver<Scene>
  }
}

extension SplashViewModel {
  func reduce(event: Event) -> State {
    let delay = event.onAppear.delay(.seconds(2), scheduler: MainScheduler.instance)
    let splashRequest = requestSplash(trigger: event.onAppear)
    let splashSuccess = splashRequest.filter { $0.isSuccess }
//    let splashFailure = splashRequest.filter { !$0.isSuccess}.compactMap { $0.message }
    return State(
      present: Observable.zip(delay, splashSuccess).map { _ in Scene.main }.asDriver(onErrorJustReturn: .empty)
    )
  }
}

extension SplashViewModel {
  func requestSplash(
    trigger: Observable<Void>)
  -> Observable<WebtoonResponse<Empty>> {
    trigger
      .compactMap { [weak self] in self?.splashInteractor }
      .flatMap { $0.requestSplash() }
      .share()
  }
}

