//
//  SplashViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import Resolver

class SplashViewController: BaseViewController {
  @Injected var viewModel: SplashViewModel
  @Injected var navigator: SplashNavigator
}

extension SplashViewController {
  override func setupUI() {
    super.setupUI()
    view.asChainable()
      .background(color: Color.malachite)
  }
}

extension SplashViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SplashViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.presentMainScene
      .drive(onNext: { [weak self] in
        self?.navigator.presentMainScene(in: self)
      }).disposed(by: disposeBag)
  }
}

