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
  @Injected var navigator: AppNavigator
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
    
    state.present
      .drive(onNext: { [weak self] in
        self?.navigator.present(scene: $0, from: self)
      }).disposed(by: disposeBag)
  }
}

