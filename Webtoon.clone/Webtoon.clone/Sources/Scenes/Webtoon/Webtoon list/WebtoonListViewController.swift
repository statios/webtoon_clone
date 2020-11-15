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
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.bottom.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
          .offset(BasePageViewController.Metric.pageBarHeight)
      }
    
  }
}

extension WebtoonListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonListViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.webtoons
      .drive(webtoonListView.rx.items(
              cellIdentifier: WebtoonListCell.className))
      { (index, webtoon, cell) in
        guard let cell = cell as? WebtoonListCell else { return }
        cell.webtoon.accept(webtoon)
      }.disposed(by: disposeBag)
  }
}
