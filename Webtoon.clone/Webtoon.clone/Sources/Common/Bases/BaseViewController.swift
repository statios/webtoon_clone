//
//  BaseViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import UIKit

class BaseViewController: UIViewController {
  
  var disposeBag = DisposeBag()
  
  var pageViewController: BasePageViewController? {
    guard let pageViewController = parent as? BasePageViewController else {
      return nil
    }
    return pageViewController
  }

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
    setupUI()
    setupBinding()
  }
  
  @objc dynamic func initialize() {
    //Don't call view in here
  }
  
  @objc dynamic func setupUI() {

  }
  
  @objc dynamic func setupBinding() {

  }

}
