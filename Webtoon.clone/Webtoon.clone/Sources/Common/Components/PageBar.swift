//
//  PageBar.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/15.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

enum PageBarStyle {
  case fill
  case fit
}

class PageBar: BaseView {
  
  struct Metric {
    static let selectedBarHeight: CGFloat = 6
    static let selectedBarY: CGFloat = BasePageViewController.Metric.pageBarHeight - Metric.selectedBarHeight
  }
  
  let selectedPage = PublishRelay<Int>()
  let currentPage = BehaviorRelay<Int>(value: 0)
  let pageBarStyle = BehaviorRelay<PageBarStyle>(value: .fit)
  
  var selectedBarView: UIView!
  var contentView: UIStackView!
  var pageBarItems = [PageBarItem]()

  var leadingConstraint: Constraint? = nil
  var trailingConstraint: Constraint? = nil
  
}

extension PageBar {
  override func setupUI() {
    super.setupUI()
    contentView = UIStackView()
      .asChainable()
      .background(color: Color.white)
      .axis(.horizontal)
      .distribution(.fillEqually)
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }.origin
    selectedBarView = UIView()
      .asChainable()
      .add(to: self)
      .corner(radius: 1)
      .origin
  }
  override func setupBinding() {
    super.setupBinding()
  }
}

extension PageBar {
  func setPageBarItems(_ viewControllers: [UIViewController]) {
    viewControllers
      .enumerated()
      .map { (offset, viewController) -> PageBarItem in
        let item = PageBarItem()
        item.title.accept(viewController.title)
        currentPage
          .distinctUntilChanged()
          .map { offset == $0 }
          .bind(to: item.isSelected)
          .disposed(by: disposeBag)
        item.fullAreaButton.rx.tap
          .map { offset }
          .bind(to: selectedPage)
          .disposed(by: disposeBag)
        pageBarItems.append(item)
        return item
      }
      .forEach { item in
        contentView.addArrangedSubview(item)
      }
    Observable.combineLatest(currentPage, pageBarStyle)
      .subscribe(onNext: { [weak self] (page, style) in
        guard let `self` = self else { return }
        guard let pageBarItem = self.contentView.subviews[page] as? PageBarItem else { return }
        let targetView = style == .fill ? pageBarItem : pageBarItem.button
        self.selectedBarView.snp.remakeConstraints { (make) in
          make.leading.trailing.equalTo(targetView)
          make.bottom.equalToSuperview()
          make.height.equalTo(Metric.selectedBarHeight)
        }
        UIView.animate(withDuration: 0.2) {
          self.selectedBarView.superview?.layoutIfNeeded()
        }
      }).disposed(by: disposeBag)
    
  }
}

