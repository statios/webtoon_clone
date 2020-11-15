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
  @Injected var viewModel: WebtoonViewModel
  @Injected var navigator: WebtoonNavigator
}

extension WebtoonViewController {
  override func initialize() {
    super.initialize()
    navigator.setViewControllers(in: self)
  }
  
  override func setupUI() {
    super.setupUI()
    
    self.asChainable()
      .pageBar(style: .fit)
      .selectedText(color: Color.malachite)
      .selectedText(font: Font.small.bold())
      .unselectedText(color: Color.black)
      .unselectedText(font: Font.small)
    
    view.asChainable()
      .background(color: Color.white)
  }
}

extension WebtoonViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

