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
    static let pageBarHeight = CGFloat(44)
  }
  
  @Injected var viewModel: WebtoonViewModel
  @Injected var navigator: WebtoonNavigator
  
  private let bannerView = UIView()
  let pageBarView = UIView()
}

extension WebtoonViewController {
  override func setupUI() {
    super.setupUI()
    navigator
      .setViewControllers(in: self)
    
    view.asChainable()
      .background(color: Color.white)
    
    bannerView.asChainable()
      .background(color: Color.empty.withAlphaComponent(0.5))
      .add(to: view)
    
    pageBarView.asChainable()
      .background(color: UIColor.systemPurple.withAlphaComponent(0.8))
      .add(to: view)
    
    
    bannerView.frame = CGRect(x: 0,
                               y: 0,
                               width: Device.width,
                               height: Metric.bannerHeight)
    pageBarView.frame = CGRect(x: 0,
                                y: Metric.bannerHeight,
                                width: Device.width,
                                height: Metric.pageBarHeight)
    
  }
}

extension WebtoonViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

