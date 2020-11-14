//
//  UIViewController.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

extension UIViewController {
  var navigationBarHeight: CGFloat {
    return self.navigationController?.navigationBar.frame.height ?? CGFloat()
  }
  var topBarHeight: CGFloat {
    return navigationBarHeight + Device.statusBarHeight
  }
}
