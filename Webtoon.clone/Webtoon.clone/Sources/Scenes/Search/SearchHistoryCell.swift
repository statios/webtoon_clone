//
//  SearchHistoryCell.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import RxSwift
import RxCocoa
import UIKit
import Resolver

final class SearchHistoryCell: BaseTableViewCell {
  @Injected var viewModel: SearchViewModel
  
  let keyword = PublishRelay<String>()
  
  private let titleLabel = UILabel()
  private let deleteButton = UIButton()
}

extension SearchHistoryCell {
  override func setupUI() {
    super.setupUI()
    contentView.asChainable()
      .border(color: Color.lightGray)
      .border(width: 0.5)
    
    deleteButton.asChainable()
      .background(color: Color.empty)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.trailing.equalToSuperview().offset(-Padding.medium)
        make.centerY.equalToSuperview()
        make.size.equalTo(32)
      }
    
    titleLabel.asChainable()
      .color(Color.gray)
      .font(Font.small)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.equalToSuperview().offset(Padding.medium)
        make.centerY.equalToSuperview()
        make.trailing.equalTo(deleteButton.snp.leading).offset(-Padding.medium)
      }
  }
}

extension SearchHistoryCell {
  override func setupBinding() {
    super.setupBinding()
    keyword
      .bind(to: titleLabel.rx.text)
      .disposed(by: disposeBag)
    
    deleteButton.rx.tap
      .compactMap { [weak self] in self?.tag }
      .bind(to: viewModel.deleteHistory)
      .disposed(by: disposeBag)
  }
}
