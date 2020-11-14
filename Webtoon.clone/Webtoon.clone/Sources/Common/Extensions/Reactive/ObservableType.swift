//
//  RxSwift.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa

extension ObservableType {
  func void() -> Observable<Void> {
    return map { _ in }
  }
  
  func unwrap<Result>() -> Observable<Result> where Element == Result? {
    return self.compactMap { $0 }
  }
  
  func withPrevious(startWith first: Element) -> Observable<(Element, Element)> {
    return scan((first, first)) { ($0.1, $1) }
  }
}

extension ObservableConvertibleType where Element == Void {
  func asDriver() -> Driver<Element> {
    return self.asDriver(onErrorJustReturn: Void())
  }
}

