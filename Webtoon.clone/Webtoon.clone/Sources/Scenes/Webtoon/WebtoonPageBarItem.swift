//
//  WebtoonPageBarItem.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

enum WebtoonPageBarItem: CaseIterable {
  case mon, tue, wed, thu, fri, sat, sun
}
extension WebtoonPageBarItem {
  var title: String {
    switch self {
    case .mon: return Text.mon
    case .tue: return Text.tue
    case .wed: return Text.wed
    case .thu: return Text.thu
    case .fri: return Text.fri
    case .sat: return Text.sat
    case .sun: return Text.sun
    }
  }
  var viewController: UIViewController {
    let viewController = WebtoonListViewController()
    viewController.title = title
    return viewController
  }
}

