//
//  WebtoonListViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa
import Resolver
import UIKit

final class WebtoonListViewModel: BaseViewModel {
  struct Event {
    let didScroll: Observable<CGPoint>
    let didEndDrag: Observable<Bool>
  }
  
  struct State {
    let navigationBarYPosition: Driver<CGFloat>
    let pageBarYPosition: Driver<CGFloat>
    let webtoonListYPosition: Driver<CGFloat>
  }
}

extension WebtoonListViewModel {
  func reduce(event: Event) -> State {
    let navigationBarYPosition = getNavigationBarYPosition(trigger: event.didScroll)
    let pageBarYPosition = getPageBarYPosition(trigger: navigationBarYPosition)
    let webtoonListYPosition = getWebtoonYPosition(trigger: navigationBarYPosition)
    
    return State(
      navigationBarYPosition: navigationBarYPosition.asDriver(onErrorJustReturn: CGFloat()),
      pageBarYPosition: pageBarYPosition.asDriver(onErrorJustReturn: CGFloat()),
      webtoonListYPosition: webtoonListYPosition.asDriver(onErrorJustReturn: CGFloat())
    )
  }
}

extension WebtoonListViewModel {
  private func getNavigationBarYPosition(
    trigger contentOffset: Observable<CGPoint>)
  -> Observable<CGFloat> {
    contentOffset
      .observeOn(MainScheduler.asyncInstance)
      .map { max(0, Device.statusBarHeight + Device.navigationBarHeight - $0.y) }
      .share()
  }
  
  private func getPageBarYPosition(
    trigger navigationBarYPosition: Observable<CGFloat>)
  -> Observable<CGFloat> {
    navigationBarYPosition
      .observeOn(MainScheduler.asyncInstance)
      .map { yPosition -> CGFloat in
        let topHeight = Device.statusBarHeight + Device.navigationBarHeight
        return max(yPosition + WebtoonViewController.Metric.pageBarHeight - 4, topHeight)
      }.share()
  }
  
  private func getWebtoonYPosition(
    trigger pageBarYPosition: Observable<CGFloat>)
  -> Observable<CGFloat> {
    pageBarYPosition
      .observeOn(MainScheduler.asyncInstance)
      .map { $0 + 2 * WebtoonViewController.Metric.pageBarHeight - 4 }
  }
}
