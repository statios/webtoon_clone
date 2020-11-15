//
//  ChallengePageBarItem.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit

enum ChallengePageBarItem: String, CaseIterable {
  case all = "all"
  case comedy = "comedy"
  case action = "action"
  case sports = "sports"
  case drama = "drama"
}

extension ChallengePageBarItem {
  var title: String {
    switch self {
    case .all: return Text.all
    case .comedy: return Text.comedy
    case .action: return Text.action
    case .sports: return Text.sports
    case .drama: return Text.drama
    }
  }
  
  var viewController: UIViewController {
    let viewController = ChallengeListViewController()
    viewController.title = title
    viewController.viewModel.category = rawValue
    return viewController
  }
}
