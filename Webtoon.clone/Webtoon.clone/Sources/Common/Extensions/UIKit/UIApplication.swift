//
//  UIView.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

extension UIApplication {
  var window: UIWindow? {
    return self.windows.first { $0.isKeyWindow }
  }
}
