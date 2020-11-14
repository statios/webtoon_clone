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
  
  private let logoImage = UIImageView()
}

extension SplashViewController {
  override func setupUI() {
    super.setupUI()
    view.asChainable()
      .background(color: Color.malachite)
    
    logoImage.asChainable()
      .background(color: Color.empty)
      .add(to: view)
      .makeConstraints { (make) in
        make.center.equalToSuperview()
        make.size.equalTo(220)
      }
  }
}

extension SplashViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SplashViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
  }
}

