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
    static let cellSize = CGSize(width: Device.width / 3, height: 192)
  }
  
  @Injected var viewModel: WebtoonListViewModel
  @Injected var navigator: WebtoonNavigator
  
  private let webtoonListView = BaseCollectionView()

}

extension WebtoonListViewController {
  override func setupUI() {
    super.setupUI()
    
    guard let pageVC = parent as? WebtoonViewController else { return }
    
    webtoonListView.asChainable()
      .register(WebtoonListCell.self)
      .itemSize(Metric.cellSize)
      .minimumLineSpacing(0)
      .minimumInteritemSpacing(0)
      .bounces(false)
      .add(to: view)
      
    let height = WebtoonViewController.Metric.bannerHeight + WebtoonViewController.Metric.pageBarHeight
    
    webtoonListView.frame = CGRect(x: 0, y: height, width: Device.width, height: Device.height - height)
    
    webtoonListView.rx.contentOffset
      .map { $0.y }
      .subscribe(onNext: {
        pageVC.pageBarView.frame.origin.y = max(WebtoonViewController.Metric.bannerHeight - $0, self.topBarHeight)
        self.webtoonListView.frame.origin.y = max(self.topBarHeight + WebtoonViewController.Metric.pageBarHeight - $0, self.topBarHeight + WebtoonViewController.Metric.pageBarHeight)
      })
    
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

