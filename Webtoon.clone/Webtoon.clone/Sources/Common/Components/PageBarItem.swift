//
//  PageBarItem.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/15.
//

import UIKit
import RxSwift
import RxCocoa

class PageBarItem: BaseView {
  
  let title = PublishRelay<String?>()
  let isSelected = PublishRelay<Bool>()
  var selectedFontColor: UIColor? = Color.black
  var unselectedFontColor: UIColor? = Color.gray
  var selectedFont: UIFont? = Font.small.bold()
  var unselectedFont: UIFont? = Font.small
  
  var button = UIButton()
  var fullAreaButton = UIButton()
}

extension PageBarItem {
  override func setupUI() {
    super.setupUI()
    button.asChainable()
      .setTitleColor(Color.black, for: .normal)
      .add(to: self)
      .makeConstraints { (make) in
        make.center.equalToSuperview()
      }
    fullAreaButton.asChainable()
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
  }
  
  override func setupBinding() {
    super.setupBinding()
    title
      .bind(to: button.rx.title())
      .disposed(by: disposeBag)
    isSelected
      .subscribe(onNext: { [weak self] in
        self?.button.setTitleColor(
          $0 ? self?.selectedFontColor
             : self?.unselectedFontColor,
          for: .normal)
        self?.button.titleLabel?.font =
          $0 ? self?.selectedFont
             : self?.unselectedFont
      }).disposed(by: disposeBag)
  }
}

