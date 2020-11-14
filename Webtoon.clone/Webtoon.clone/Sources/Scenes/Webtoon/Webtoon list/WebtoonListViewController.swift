//
//  WebtoonListViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import Resolver

final class WebtoonListViewController: BaseViewController {
  struct Metric {
    static let cellWidth = CGFloat(Device.width / 3)
    static let cellHeight = CGFloat(192)
  }
  
  @Injected var viewModel: WebtoonListViewModel
  @Injected var navigator: WebtoonNavigator
  
  private let webtoonListView: BaseCollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
    layout.itemSize = CGSize(width: Metric.cellWidth, height: Metric.cellHeight)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    return view
  }()
}

extension WebtoonListViewController {
  override func setupUI() {
    super.setupUI()
    
    webtoonListView.asChainable()
      .register(WebtoonListCell.self)
      .bounces(false)
      .add(to: view)
      .makeConstraints { (make) in
        make.top.equalToSuperview()
        make.leading.trailing.bottom.equalToSuperview()
      }
    
    webtoonListView.rx.contentOffset
      .subscribe(onNext: { [weak self] in
        guard let `self` = self else { return }
        let yPosition = max(0, self.topBarHeight - $0.y)
        self.navigationController?.navigationBar.bounds.origin.y = yPosition
      }).disposed(by: disposeBag)
    
    let kkk = [UIColor.red, UIColor.yellow, .green,
               .blue, UIColor.red, UIColor.yellow,
               .green, .blue, UIColor.red, UIColor.yellow,
               .green, .blue, UIColor.red, UIColor.yellow,
               .green, .blue]
    Observable.just(kkk)
      .bind(to: webtoonListView.rx.items(
              cellIdentifier: WebtoonListCell.className)) { (index, color, cell) in
        cell.contentView.backgroundColor = color
      }.disposed(by: disposeBag)
  }
}

extension WebtoonListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonListViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

