////
////  MainTabBarItem.swift
////  Webtoon.clone
////
////  Created by Stat.So on 2020/11/14.
////

import UIKit

enum MainTabBarItem: CaseIterable {
  case webtoon
  case challenge
  case setting
}

extension MainTabBarItem {
  var title: String {
    switch self {
    case .webtoon: return Text.webtoon
    case .challenge: return Text.challenge
    case .setting: return Text.setting
    }
  }
  
  var viewController: UIViewController {
    var viewController: UIViewController
    switch self {
    case .webtoon: viewController = WebtoonViewController()
    case .challenge: viewController = ChallengeViewController()
    case .setting: viewController = SettingViewController()
    }
    viewController.title = title
    return viewController
  }
}

