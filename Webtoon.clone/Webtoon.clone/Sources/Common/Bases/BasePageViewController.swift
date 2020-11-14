//
//  BasePageViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift
import RxCocoa

class BasePageViewController: UIPageViewController {
  
  var disposeBag = DisposeBag()
  var pageViewControllers = [UIViewController]()
  var currentPage = BehaviorRelay<Int>(value: 0)
  
  init() {
    super.init(transitionStyle: .scroll,
               navigationOrientation: .horizontal,
               options: nil)
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
    self.dataSource = self
    self.delegate = self
  }
  
  @objc dynamic func setupUI() {
  }
  
  @objc dynamic func setupBinding() {
  }
  
  func setPageViewControllers(_ viewControllers: [UIViewController]) {
    self.pageViewControllers = viewControllers
    self.setViewControllers([viewControllers.first].compactMap { $0 },
                            direction: .forward,
                            animated: true,
                            completion: nil)
  }
  
}

extension BasePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerBefore viewController: UIViewController)
  -> UIViewController? {
    guard let index = pageViewControllers.firstIndex(of: viewController) else {
      return nil
    }
    let previousIndex = index - 1
    guard previousIndex >= 0 else {
      return nil
    }
    return pageViewControllers[previousIndex]
  }
  
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerAfter viewController: UIViewController)
  -> UIViewController? {
    guard let index = pageViewControllers.firstIndex(of: viewController) else {
      return nil
    }
    let nextIndex = index + 1
    guard pageViewControllers.count-1 >= nextIndex else {
      return nil
    }
    return pageViewControllers[nextIndex]
  }
  
  func pageViewController(
    _ pageViewController: UIPageViewController,
    didFinishAnimating finished: Bool,
    previousViewControllers: [UIViewController],
    transitionCompleted completed: Bool) {
    guard completed else { return }
    if let currentViewController = pageViewController.viewControllers?.first,
       let index = pageViewControllers.firstIndex(of: currentViewController) {
      currentPage.accept(index)
    }
  }
}
