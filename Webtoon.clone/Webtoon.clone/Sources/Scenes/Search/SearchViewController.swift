//
//  SearchViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit
import RxSwift
import Resolver

final class SearchViewController: BaseViewController {
  struct Metric {
    static let searchBarHeight = CGFloat(32)
  }
  
  @Injected var navigator: AppNavigator
  @Injected var viewModel: SearchViewModel
  
  private let searchTextField = UITextField()
  private let cancelButton = UIButton()
}

extension SearchViewController {
  override func setupUI() {
    super.setupUI()
    view.asChainable()
      .background(color: Color.white)
    
    cancelButton.asChainable()
      .addBarButtonItem(self, position: .right)
      .setTitle(Text.cancel, for: .normal)
      .setTitleColor(Color.black, for: .normal)
    
    searchTextField.asChainable()
      .returnKey(type: .search)
      .placeholder(Text.searchTitleAuthor)
      .frameWidth(Device.width)
      .addBarButtonItem(self, position: .left)
      .border(style: .roundedRect)
  }
}

extension SearchViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SearchViewModel.Event(
      tapCancel: cancelButton.rx.tap.asObservable(),
      didAppear: rx.viewDidAppear.void(),
      tapSearch: searchTextField.rx.controlEvent([.editingDidEndOnExit]).void(),
      changeText: searchTextField.rx.text.orEmpty.asObservable()
    )
    let state = viewModel.reduce(event: event)
    
    state.pop
      .drive(onNext: { [weak self] in
        self?.navigator.pop(from: self)
      }).disposed(by: disposeBag)
    
    state.focusSearch
      .drive(onNext: { [weak self] in
        self?.searchTextField.becomeFirstResponder()
      }).disposed(by: disposeBag)
  }
}

