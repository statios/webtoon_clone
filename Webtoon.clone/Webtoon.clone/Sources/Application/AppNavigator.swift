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
    Resolver.register { SplashInteractor() }
      .implements(SplashInteractable.self)
  }
  static func registerServices() {
    #if DEBUG
    Resolver.register {
      WebtoonSampleService()
    }.implements(WebtoonServiceType.self)
    .scope(Resolver.application) //Singleton
    #else
    Resolver.register {
      WebtoonService()
    }.implements(WebtoonServiceType.self)
    .scope(Resolver.application)
    #endif
  }
}
