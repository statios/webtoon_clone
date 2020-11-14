//
//  AppDelegate+Injection.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import Resolver

class AppNavigator: BaseNavigator {
  static func presentSplashScene(in window: UIWindow?) {
    guard let window = window else { return }
    window.rootViewController = SplashViewController()
    window.backgroundColor = .white
    window.makeKeyAndVisible()
  }
}

extension AppNavigator {
  static func registerSplashScene() {
    Resolver.register { SplashViewModel() }
    Resolver.register { SplashNavigator() }
  }
}
