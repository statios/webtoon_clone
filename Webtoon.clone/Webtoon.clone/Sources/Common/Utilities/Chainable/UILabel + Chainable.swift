//
//  UILabel + Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

extension Chain where Origin: UILabel {
  @discardableResult
  func text(_ text: String?) -> Chain {
    self.origin.text = text
    return self
  }
  
  @discardableResult
  func textAlignment(_ by: NSTextAlignment) -> Chain {
    self.origin.textAlignment = by
    return self
  }
  
  @discardableResult
  func font(_ by: UIFont?) -> Chain {
    self.origin.font = by
    return self
  }
  
  @discardableResult
  func color(_ color: UIColor?) -> Chain {
    self.origin.textColor = color
    return self
  }
  
  @discardableResult
  func numberOfLines(_ lines: Int) -> Chain {
    self.origin.numberOfLines = lines
    return self
  }
}
