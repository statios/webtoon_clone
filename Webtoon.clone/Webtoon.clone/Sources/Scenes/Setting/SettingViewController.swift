//
//  SettingViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import Resolver

final class SettingViewController: BaseViewController {
  
  @Injected var viewModel: SettingViewModel
  @Injected var navigator: SettingNavigator
  
}

extension SettingViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension SettingViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SettingViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

