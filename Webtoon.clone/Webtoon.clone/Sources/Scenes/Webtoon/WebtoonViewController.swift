//
//  ListViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import RxCocoa
import Resolver

final class WebtoonViewController: BasePageViewController {
  struct Metric {
    static let bannerHeight = CGFloat(144)
  }
  
  @Injected var viewModel: WebtoonViewModel
  @Injected var navigator: WebtoonNavigator
  
  private let bannerView = UIView()
}

extension WebtoonViewController {
  override func setupUI() {
    super.setupUI()
    navigator.setViewControllers(in: self)
    
    bannerView.asChainable()
      .background(color: Color.empty)
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.top.equalToSuperview()
        make.height.equalTo(Metric.bannerHeight)
      }
  }
}

extension WebtoonViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

