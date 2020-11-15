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
  
  struct Metric {
    static let pageBarHeight: CGFloat = 44
  }
  
  var disposeBag = DisposeBag()
  
  var currentPage = BehaviorRelay<Int>(value: 0)
  
  var pageViewControllers = [UIViewController]()
  var pageBar = PageBar()
  
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
    pageBar.asChainable()
      .add(to: view)
      .makeConstraints { (make) in
        make.leading.trailing.equalToSuperview()
        make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        make.height.equalTo(Metric.pageBarHeight)
      }
  }
  
  @objc dynamic func setupBinding() {
    pageBar.selectedPage
      .withPrevious(startWith: 0)
      .subscribe(onNext: { [weak self] (previous, current) in
        let direction: NavigationDirection = previous <= current ? .forward : .reverse
        self?.pageBar.currentPage.accept(current)
        self?.moveTo(page: current, direction: direction)
      }).disposed(by: disposeBag)
  }
  
  func setPageViewControllers(_ viewControllers: [UIViewController]) {
    pageViewControllers = viewControllers
    setViewControllers([viewControllers.first].compactMap { $0 },
                       direction: .forward,
                       animated: true,
                       completion: nil)
    pageBar.setPageBarItems(viewControllers)
    let scrollView = view.subviews.filter { $0 is UIScrollView }.first as! UIScrollView
    scrollView.delegate = self
  }
  func selectedText(color: UIColor?) {
    pageBar.selectedBarView.backgroundColor = color
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.selectedFontColor = color
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
  }
  
  func unselectedText(color: UIColor?) {
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.unselectedFontColor = color
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
  }
  
  func selected(font: UIFont?) {
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.selectedFont = font
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
  }

  func unselected(font: UIFont?) {
    pageBar.pageBarItems.enumerated().forEach { (offset, pageBarItem) in
      pageBarItem.unselectedFont = font
      pageBarItem.isSelected.accept(offset == currentPage.value)
    }
  }
  
  func pageBar(style: PageBarStyle) {
    pageBar.pageBarStyle.accept(style)
  }
  
  func moveTo(page: Int, direction: NavigationDirection) {
    self.setViewControllers([pageViewControllers[page]],
                            direction: direction,
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
      pageBar.currentPage.accept(index)
    }
  }
}

extension BasePageViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {

  }
}

extension Chain where Origin: BasePageViewController {
  @discardableResult
  func pageBar(style: PageBarStyle) -> Chain {
    self.origin.pageBar(style: style)
    return self
  }
  @discardableResult
  func selectedText(color: UIColor?) -> Chain {
    self.origin.selectedText(color: color)
    return self
  }
  @discardableResult
  func unselectedText(color: UIColor?) -> Chain {
    self.origin.unselectedText(color: color)
    return self
  }
  @discardableResult
  func selectedText(font: UIFont?) -> Chain {
    self.origin.selected(font: font)
    return self
  }
  @discardableResult
  func unselectedText(font: UIFont?) -> Chain {
    self.origin.unselected(font: font)
    return self
  }
}
