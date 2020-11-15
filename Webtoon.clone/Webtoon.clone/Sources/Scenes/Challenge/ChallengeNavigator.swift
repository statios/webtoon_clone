//
//  ChallengeNavigator.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Resolver

final class ChallengeNavigator: BaseNavigator {
  func setViewControllers(in target: BasePageViewController) {
    let viewControllers = ChallengePageBarItem.allCases.map { $0.viewController }
    target.setPageViewControllers(viewControllers)
  }
}

extension ChallengeNavigator {
  static func registerChallengeScenes() {
    Resolver.register { ChallengeListViewModel() }.scope(Resolver.unique)
  }
}

