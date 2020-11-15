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
    static let pageBarHeight = CGFloat(48)
    static let bannerFrame = CGRect(x: 0, y: 0, width: Device.width, height: Metric.bannerHeight)
    static let pageBarFrame = CGRect(x: 0, y: 0, width: Device.width, height: Metric.pageBarHeight)
  }
  
  @Injected var viewModel: WebtoonViewModel
  @Injected var navigator: WebtoonNavigator
  
  private let bannerView = UIView()
}

extension WebtoonViewController {
  override func setupUI() {
    super.setupUI()
    navigator
      .setViewControllers(in: self)
    
    view.asChainable()
      .background(color: Color.white)
    
    bannerView.asChainable()
      .background(color: .brown)
      .frame(Metric.bannerFrame)
      .add(to: view)
    
    pageBar.asChainable()
      .frame(Metric.pageBarFrame)
      .background(color: UIColor.systemPurple)
      .add(to: view)
  }
}

extension WebtoonViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

