//
//  BaseTabBarController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import UIKit

class BaseTabBarController: UITabBarController {
  
  var disposeBag = DisposeBag()
  
  init() {
    super.init(nibName: nil, bundle: nil)
    Log.verbose(String(describing: Self.self))
    initialize()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    rx.viewWillAppear.take(1)
      .subscribe(onNext: { [weak self] _ in
        self?.setupUI()
        self?.setupBinding()
      }).disposed(by: disposeBag)
  }
  
  @objc dynamic func initialize() {
    //Don't call view in here
  }
  
  @objc dynamic func setupUI() {
    tabBar.asChainable()
      .barTint(color: Color.white)
  }
  
  @objc dynamic func setupBinding() {

  }
}
