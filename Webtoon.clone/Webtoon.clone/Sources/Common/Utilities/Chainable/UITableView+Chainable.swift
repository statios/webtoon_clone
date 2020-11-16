//
//  UITableView+Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit

extension Chain where Origin: UITableView {
  @discardableResult
  func register(_ cellType: UITableViewCell.Type) -> Chain {
    self.origin.register(cellType, forCellReuseIdentifier: cellType.className)
    return self
  }
  
  @discardableResult
  func keyboardDismiss(mode: UIScrollView.KeyboardDismissMode) -> Chain {
    self.origin.keyboardDismissMode = mode
    return self
  }
  
  @discardableResult
  func rowHeight(_ height: CGFloat) -> Chain {
    self.origin.rowHeight = height
    return self
  }
}
