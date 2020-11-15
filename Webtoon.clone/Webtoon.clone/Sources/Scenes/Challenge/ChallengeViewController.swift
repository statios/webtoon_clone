//
//  ChallengeViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import Resolver

final class ChallengeViewController: BasePageViewController {
  
  @Injected var viewModel: ChallengeViewModel
  @Injected var navigator: ChallengeNavigator
  
}

extension ChallengeViewController {
  override func initialize() {
    super.initialize()
    navigator.setViewControllers(in: self)
  }
  override func setupUI() {
    super.setupUI()
    
    self.asChainable()
      .pageBar(style: .fill)
      .selectedText(color: Color.malachite)
      .selectedText(font: Font.small.bold())
      .unselectedText(color: Color.black)
      .unselectedText(font: Font.small)
    
    view.asChainable()
      .background(color: Color.white)
  }
}

extension ChallengeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = ChallengeViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

