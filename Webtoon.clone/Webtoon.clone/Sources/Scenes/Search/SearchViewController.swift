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
    static let historyViewHeight = CGFloat(240)
    static let historyCellHeight = CGFloat(48)
  }
  
  @Injected var navigator: AppNavigator
  @Injected var viewModel: SearchViewModel
  
  private let searchTextField = UITextField()
  private let cancelButton = UIButton()
  private let historyView = BaseTableView()
  private let emtpyView = UILabel()
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
      .clearButton(mode: .whileEditing)
      .frameWidth(Device.width)
      .addBarButtonItem(self, position: .left)
      .border(style: .roundedRect)
    
    historyView.asChainable()
      .register(SearchHistoryCell.self)
      .keyboardDismiss(mode: .none)
      .rowHeight(Metric.historyCellHeight)
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        make.height.equalTo(Metric.historyViewHeight)
      }
    
    emtpyView.asChainable()
      .font(Font.large.bold())
      .color(Color.black)
      .text(Text.searchEmpty)
      .isHidden(true)
      .add(to: view)
      .makeConstraints { (make) in
        make.center.equalToSuperview()
      }
    
  }
}

extension SearchViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SearchViewModel.Event(
      tapCancel: cancelButton.rx.tap.void(),
      didAppear: rx.viewDidAppear.void(),
      tapSearch: searchTextField.rx.controlEvent([.editingDidEndOnExit]).void(),
      didChangedText: searchTextField.rx.text.orEmpty.asObservable(),
      didBeganEditing: searchTextField.rx.controlEvent(.editingDidBegin).void(),
      didEndEditing: searchTextField.rx.controlEvent(.editingDidEnd).void(),
      tapCell: historyView.rx.itemSelected.asObservable()
    )
    let state = viewModel.reduce(event: event)
    
    state.pop
      .drive(onNext: { [weak self] in
        self?.navigator.pop(from: self)
      }).disposed(by: disposeBag)
    
    state.focusSearch.filter { $0 }
      .drive(onNext: { [weak self] _ in
        self?.searchTextField.becomeFirstResponder()
      }).disposed(by: disposeBag)
    
    state.focusSearch.filter { !$0 }
      .drive(onNext: { [weak self] _ in
        self?.searchTextField.endEditing(true)
      }).disposed(by: disposeBag)
    
    state.historyIsHidden
      .drive(historyView.rx.isHidden)
      .disposed(by: disposeBag)
    
    state.searchHistory
      .drive(historyView.rx.items(cellIdentifier: SearchHistoryCell.className))
      { (index, keyword, cell) in
        guard let cell = cell as? SearchHistoryCell else { return }
        cell.keyword.accept(keyword)
        cell.tag = index
      }.disposed(by: disposeBag)
    
    state.isEmptyResult.map { !$0 }
      .drive(emtpyView.rx.isHidden)
      .disposed(by: disposeBag)
    
    state.historyIsHidden
      .filter { !$0 }.map { _ in true }
      .drive(emtpyView.rx.isHidden)
      .disposed(by: disposeBag)
  }
}

