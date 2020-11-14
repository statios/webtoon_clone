//
//  ChallengeViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import Resolver

final class ChallengeViewController: BaseViewController {
  
  @Injected var viewModel: ChallengeViewModel
  @Injected var navigator: ChallengeNavigator
  
}

extension ChallengeViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension ChallengeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = ChallengeViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

