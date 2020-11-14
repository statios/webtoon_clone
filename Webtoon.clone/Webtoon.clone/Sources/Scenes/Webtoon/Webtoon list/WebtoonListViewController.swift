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
  @Injected var viewModel: WebtoonListViewModel
  @Injected var navigator: WebtoonNavigator
  
  private let bannerView: BaseCollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: Device.width, height: Metric.topBannerHeight)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    return view
  }()
}

extension WebtoonListViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension WebtoonListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = WebtoonListViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

