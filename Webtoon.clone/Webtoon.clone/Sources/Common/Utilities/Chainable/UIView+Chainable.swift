//
//  UIView+Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import SnapKit

extension UIView: Chainable { }

extension Chain where Origin: UIView {
  
  @discardableResult
  func add(to: UIView) -> Chain {
    to.addSubview(self.origin)
    return self
  }
  
  @discardableResult
  func background(color: UIColor?) -> Chain {
    self.origin.backgroundColor = color
    return self
  }
  
  @discardableResult
  func makeConstraints(closure: (ConstraintMaker) -> Void) -> Chain {
    self.origin.snp.makeConstraints(closure)
    return self
  }
  
  @discardableResult
  func remakeConstraints(closure: (ConstraintMaker) -> Void) -> Chain {
    self.origin.snp.remakeConstraints(closure)
    return self
  }
  
  @discardableResult
  func border(color: UIColor?) -> Chain {
    self.origin.layer.borderColor = color?.cgColor
    return self
  }
  
  @discardableResult
  func border(width: CGFloat) -> Chain {
    self.origin.layer.borderWidth = width
    return self
  }
  
  @discardableResult
  func corner(radius: CGFloat) -> Chain {
    self.origin.layer.cornerRadius = radius
    return self
  }

  @discardableResult
  func clipToBounds(_ by: Bool) -> Chain {
    self.origin.clipsToBounds = by
    return self
  }
  
  @discardableResult
  func contentMode(_ by: UIView.ContentMode) -> Chain {
    self.origin.contentMode = by
    return self
  }
  
  @discardableResult
  func tintColor(_ by: UIColor?) -> Chain {
    self.origin.tintColor = by
    return self
  }
  
  @discardableResult
  func frame(_ by: CGRect) -> Chain {
    self.origin.frame = by
    return self
  }
  
  @discardableResult
  func frameSize(_ size: CGSize) -> Chain {
    self.origin.frame.size = size
    return self
  }
  
  @discardableResult
  func frameWidth(_ width: CGFloat) -> Chain {
    self.origin.frame.size.width = width
    return self
  }
  
  @discardableResult
  func isHidden(_ isHidden: Bool) -> Chain {
    self.origin.isHidden = isHidden
    return self
  }
  
  @discardableResult
  func alpha(_ alpha: CGFloat) -> Chain {
    self.origin.alpha = alpha
    return self
  }
  
  @discardableResult
  func maskedCorners(_ mask: CACornerMask) -> Chain {
    self.origin.layer.maskedCorners = mask
    return self
  }
  
  @discardableResult
  func semanticContentAttribute(_ attribute: UISemanticContentAttribute) -> Chain {
    self.origin.semanticContentAttribute = attribute
    return self
  }
  
  @discardableResult
  func addBarButtonItem(_ target: UIViewController, position: Direction) -> Chain {
    let barButtonItem = UIBarButtonItem(customView: self.origin)
    if position == .left {
      target.navigationItem.leftBarButtonItem = barButtonItem
    } else if position == .right {
      target.navigationItem.rightBarButtonItem = barButtonItem
    } else if position == .mid {
      target.navigationItem.titleView = self.origin
    }
//    target.navigationItem.title
    return self
  }
}

enum Direction: Int, Codable {
  case left = 0
  case right = 1
  case top = 2
  case bottom = 3
  case mid = 4
}

