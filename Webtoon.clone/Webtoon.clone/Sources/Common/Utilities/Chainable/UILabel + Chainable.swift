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
}
