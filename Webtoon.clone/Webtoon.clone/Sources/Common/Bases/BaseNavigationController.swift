//
//  BaseNavigationController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import UIKit

class BaseNavigationController: UINavigationController {
  
  var disposeBag = DisposeBag()
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
//    Log.verbose(String(describing: Self.self))
    initialize()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  deinit {
//    Log.verbose(String(describing: Self.self))
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupBinding()
  }
  
  @objc dynamic func initialize() {
    //Don't call view in here
  }
  
  @objc dynamic func setupUI() {
    navigationBar.barTintColor = Color.white
    navigationBar.isTranslucent = false
  }
  
  @objc dynamic func setupBinding() {

  }
}
