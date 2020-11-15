//
//  WebtoonPageBarItem.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

enum WebtoonPageBarItem: Int, CaseIterable {
  case sun = 0
  case mon = 1
  case tue = 2
  case wed = 3
  case thu = 4
  case fri = 5
  case sat = 6
}
extension WebtoonPageBarItem {
  var title: String {
    switch self {
    case .sun: return Text.sun
    case .mon: return Text.mon
    case .tue: return Text.tue
    case .wed: return Text.wed
    case .thu: return Text.thu
    case .fri: return Text.fri
    case .sat: return Text.sat
    }
  }
  
  var viewController: UIViewController {
    let viewController = WebtoonListViewController()
    viewController.title = title
    viewController.viewModel.weekday = rawValue
    return viewController
  }
}

