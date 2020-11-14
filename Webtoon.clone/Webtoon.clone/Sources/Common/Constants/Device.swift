//
//  Device.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

struct Device {
  static let width: CGFloat = UIScreen.main.bounds.width
  static let height: CGFloat = UIScreen.main.bounds.height
  static let statusBarHeight: CGFloat = UIApplication.shared
    .window?.windowScene?.statusBarManager?.statusBarFrame.height ?? CGFloat()
}
