//
//  SplashNavigator.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Resolver
import UIKit

class SplashNavigator: BaseNavigator {
  func presentMainScene(in target: UIViewController) {
    let viewControllelr = MainViewController()
    viewControllelr.modalPresentationStyle = .fullScreen
    target.present(viewControllelr, animated: true)
  }
}

extension SplashNavigator {
  static func registerSplashScenes() {
    Resolver.register { MainNavigator() }
    Resolver.register { MainViewModel() }
  }
}
