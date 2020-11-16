//
//  AppDelegate+Injection.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import Resolver

final class AppNavigator {
  var root: UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = SplashViewController()
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    return window
  }
  
  func pop(from target: UIViewController?,
           animated: Bool = true) {
    target?.navigationController?.popViewController(animated: animated)
  }
  
  func push(scene: Scene,
            from target: UIViewController?,
            animated: Bool = true) {
    guard scene.hidesBottomBarWhenPushed else {
      target?.navigationController?.pushViewController(scene.viewController, animated: animated)
      return
    }
    target?.hidesBottomBarWhenPushed = true
    target?.navigationController?.pushViewController(scene.viewController, animated: animated)
    target?.hidesBottomBarWhenPushed = false
  }
  
  func present(scene: Scene,
               from target: UIViewController?,
               animated: Bool = true,
               completion: (() -> Void)? = nil) {
    let viewController = scene.viewController
    viewController.modalTransitionStyle = scene.transitionStyle
    viewController.modalPresentationStyle = scene.presentationStyle
    target?.present(viewController, animated: animated, completion: completion)
  }
  
  func dismiss(from target: UIViewController?,
               animated: Bool = true,
               completion: (() -> Void)? = nil) {
    target?.dismiss(animated: animated, completion: completion)
  }
  
  func setTabBar(viewControllers: [UIViewController],
                 from target: BaseTabBarController?,
                 animated: Bool = true) {
    target?.setViewControllers(viewControllers, animated: animated)
  }
  
  func setPage(viewControllers: [UIViewController],
                              from target: BasePageViewController?) {
    target?.setPageViewControllers(viewControllers)
  }
}
