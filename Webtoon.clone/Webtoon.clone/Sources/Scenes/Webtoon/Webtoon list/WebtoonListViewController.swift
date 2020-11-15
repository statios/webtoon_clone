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
    
    webtoonListView.asChainable()
      .register(WebtoonListCell.self)
      .itemSize(Metric.cellSize)
      .minimumLineSpacing(0)
      .minimumInteritemSpacing(0)
      .bounces(false)
      .add(to: view)
    
    webtoonListView.frame = CGRect(x: 0,
                                   y: WebtoonViewController.Metric.bannerHeight + WebtoonViewController.Metric.pageBarHeight,
                                   width: Device.width,
                                   height: Device.height)
    
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
    let event = WebtoonListViewModel.Event(
      didScroll: webtoonListView.rx.contentOffset.asObservable(),
      didEndDrag: webtoonListView.rx.didEndDragging.asObservable()
    )
    let state = viewModel.reduce(event: event)
    
    state.navigationBarYPosition
      .drive(onNext: { [weak self] in
        self?.navigationController?.navigationBar.bounds.origin.y = $0
      }).disposed(by: disposeBag)
    
    state.pageBarYPosition
      .drive(onNext: { [weak self] in
        self?.pageViewController?.pageBar.frame.origin.y = $0
      }).disposed(by: disposeBag)
    
    state.webtoonListYPosition
      .drive(onNext: { [weak self] in
        self?.webtoonListView.frame.origin.y = $0
        self?.webtoonListView.frame.size.height = Device.height - $0
      }).disposed(by: disposeBag)
  }
}
