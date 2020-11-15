//
//  MainNavigator.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import Resolver

class MainNavigator: BaseNavigator {
  func setViewControllers(in target: UITabBarController?) {
    let viewControllers = MainTabBarItem.allCases
      .map { BaseNavigationController(rootViewController: $0.viewController) }
    target?.setViewControllers(viewControllers, animated: true)
  }
}

extension MainNavigator {
  static func registerMainScenes() {
    Resolver.register { WebtoonNavigator() }
      .scope(Resolver.shared)
    Resolver.register { WebtoonViewModel() }
    Resolver.register { WebtoonInteractor() }
      .implements(WebtoonInteractable.self)
    Resolver.register { ChallengeNavigator() }
      .scope(Resolver.shared)
    Resolver.register { ChallengeViewModel() }
    Resolver.register { ChallengeInteractor() }
      .implements(ChallengeInteractable.self)
    Resolver.register { SettingNavigator() }
    Resolver.register { SettingViewModel() }
    Resolver.register { SettingInteractor() }
      .implements(SettingInteractable.self)
  }
}
