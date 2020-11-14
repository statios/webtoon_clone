//
//  NSObject.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Foundation

extension NSObject {
  static var className: String {
    return String(describing: Self.self)
  }
}
