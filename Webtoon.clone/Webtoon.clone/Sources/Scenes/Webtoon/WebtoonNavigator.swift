//
//  WebtoonNavigator.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Resolver
import UIKit

final class WebtoonNavigator: BaseNavigator {
  func setViewControllers(in target: BasePageViewController) {
    let viewControllers = WebtoonPageBarItem.allCases.map { $0.viewController }
    target.setPageViewControllers(viewControllers)
  }
}

extension WebtoonNavigator {
  static func registerWebtoonScenes() {
    Resolver.register { WebtoonListViewModel() }.scope(Resolver.unique)
  }
}
