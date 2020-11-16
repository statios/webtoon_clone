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
  @Injected var navigator: AppNavigator
  
  private let searchButton = UIButton()
}

extension WebtoonViewController {
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
    
    searchButton.asChainable()
      .addBarButtonItem(self, position: .right)
      .background(color: Color.empty)
  }
}

extension WebtoonViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonViewModel.Event(
      tapSearch: searchButton.rx.tap.asObservable()
    )
    let state = viewModel.reduce(event: event)
    
    state.pages
      .drive(onNext: { [weak self] in
        self?.navigator.setPage(viewControllers: $0, from: self)
      }).disposed(by: disposeBag)
    
    state.push
      .drive(onNext: { [weak self] in
        self?.navigator.push(scene: $0, from: self)
      }).disposed(by: disposeBag)
  }
}

