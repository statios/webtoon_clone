//
//  Scene.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit

enum Scene {
  case empty
  case splash
  case main
  case webtoon
  case webtoonList
  case challenge
  case challengeList
  case setting
  case search
}

extension Scene {
  var viewController: UIViewController {
    switch self {
    case .empty: return UIViewController()
    case .splash: return SplashViewController()
    case .main: return MainViewController()
    case .webtoon: return WebtoonViewController()
    case .webtoonList: return WebtoonListViewController()
    case .challenge: return ChallengeViewController()
    case .challengeList: return ChallengeListViewController()
    case .setting: return SettingViewController()
    case .search: return SearchViewController()
    }
  }
  
  var hidesBottomBarWhenPushed: Bool {
    switch self {
    case .search: return true
    default: return false
    }
  }
  
  var transitionStyle: UIModalTransitionStyle {
    switch self {
    case .main: return .crossDissolve
    default: return .coverVertical
    }
  }
  
  var presentationStyle: UIModalPresentationStyle {
    switch self {
    default: return .fullScreen
    }
  }
}
