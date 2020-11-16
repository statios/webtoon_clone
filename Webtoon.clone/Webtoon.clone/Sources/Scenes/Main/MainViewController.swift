//
//  MainViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import Resolver

class MainViewController: BaseTabBarController {
  
  @Injected var viewModel: MainViewModel
  @Injected var navigator: AppNavigator
  
}

extension MainViewController {
  override func initialize() {
    super.initialize()
    let viewControllers = MainTabBarItem.allCases
      .map { BaseNavigationController(rootViewController: $0.viewController) }
    navigator.setTabBar(viewControllers: viewControllers, from: self)
  }
  override func setupUI() {
    super.setupUI()
  }
}

extension MainViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = MainViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

