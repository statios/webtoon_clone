//
//  ChallengeViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa
import Resolver
import UIKit

final class ChallengeViewModel: BaseViewModel {
  struct Event {
    let tapSearch: Observable<Void>
  }
  
  struct State {
    let pages: Driver<[UIViewController]>
    let push: Driver<Scene>
  }
}

extension ChallengeViewModel {
  func reduce(event: Event) -> State {
    return State(
      pages: Driver.just(ChallengePageBarItem.allCases.map { $0.viewController }),
      push: event.tapSearch.map { Scene.search }.asDriver(onErrorJustReturn: .empty)
    )
  }
}
