//
//  UIButton+Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/15.
//

import UIKit

extension Chain where Origin: UIButton {
  @discardableResult
  func setTitleColor(_ by: UIColor?, for state: UIControl.State) -> Chain {
    self.origin.setTitleColor(by, for: state)
    return self
  }
  
  @discardableResult
  func setImage(_ by: UIImage?, for state: UIControl.State) -> Chain {
    self.origin.setImage(by, for: state)
    return self
  }
  
  @discardableResult
  func setTitle(_ title: String?, for state: UIControl.State) -> Chain {
    self.origin.setTitle(title, for: state)
    return self
  }
  
  @discardableResult
  func addBarButtonItem(_ target: UIViewController, position: Direction) -> Chain {
    let barButtonItem = UIBarButtonItem(customView: self.origin)
    if position == .left {
      target.navigationItem.leftBarButtonItem = barButtonItem
    } else if position == .right {
      target.navigationItem.rightBarButtonItem = barButtonItem
    }
    return self
  }
  
  @discardableResult
  func font(_ font: UIFont?) -> Chain {
    self.origin.titleLabel?.font = font
    return self
  }
  
  @discardableResult
  func contentEdgeInsets(_ insets: UIEdgeInsets) -> Chain {
    self.origin.contentEdgeInsets = insets
    return self
  }
}

enum Direction: Int, Codable {
  case left = 0
  case right = 1
  case top = 2
  case bottom = 3
}

