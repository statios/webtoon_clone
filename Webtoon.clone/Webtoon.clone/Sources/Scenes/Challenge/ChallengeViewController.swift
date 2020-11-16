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
  @Injected var navigator: AppNavigator
  
  private let searchButton = UIButton()
}

extension ChallengeViewController {
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
    
    searchButton.asChainable()
      .addBarButtonItem(self, position: .right)
      .background(color: Color.empty)
  }
}

extension ChallengeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = ChallengeViewModel.Event(
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

