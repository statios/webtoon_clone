//
//  UITextField+Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit

extension Chain where Origin: UITextField {
  @discardableResult
  func border(style: UITextField.BorderStyle) -> Chain {
    self.origin.borderStyle = style
    return self
  }
  
  @discardableResult
  func placeholder(_ text: String?) -> Chain {
    self.origin.placeholder = text
    return self
  }
  
  @discardableResult
  func keyboard(type: UIKeyboardType) -> Chain {
    self.origin.keyboardType = type
    return self
  }
  
  @discardableResult
  func returnKey(type: UIReturnKeyType) -> Chain {
    self.origin.returnKeyType = type
    return self
  }
  
  @discardableResult
  func clearButton(mode: UITextField.ViewMode) -> Chain {
    self.origin.clearButtonMode = mode
    return self
  }
}
