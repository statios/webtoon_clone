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
//  var image: UIImage? {
//    switch self {
//    case .home: return Image.Icon.home
//    case .suggest: return Image.Icon.video
//    case .like: return Image.Icon.like
//    }
//  }
  var viewController: UIViewController {
    var viewController: UIViewController
    switch self {
    case .webtoon: viewController = WebtoonViewController()
    case .challenge: viewController = ChallengeViewController()
    case .setting: viewController = SettingViewController()
    }
    viewController.title = title
//    viewController.tabBarItem.image = image
    return viewController
  }
}

