//
//  ChallengeListViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit
import RxSwift
import Resolver

final class ChallengeListViewController: BaseViewController {
  
  @Injected var viewModel: ChallengeListViewModel
  @Injected var navigator: AppNavigator
  
  private let challengeListView = BaseTableView()
}

extension ChallengeListViewController {
  override func setupUI() {
    super.setupUI()
    challengeListView.asChainable()
      .register(ChallengeListCell.self)
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.bottom.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
          .offset(BasePageViewController.Metric.pageBarHeight)
      }
  }
}

extension ChallengeListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = ChallengeListViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
    state.challenges
      .drive(challengeListView.rx.items(
              cellIdentifier: ChallengeListCell.className))
      { (index, challenge, cell) in
        guard let cell = cell as? ChallengeListCell else { return }
        cell.challenge.accept(challenge)
      }.disposed(by: disposeBag)
  }
}

