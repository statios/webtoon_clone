//
//  UIImageView+Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

extension Chain where Origin: UIImageView {
  @discardableResult
  func image(_ image: UIImage?) -> Chain {
    self.origin.image = image
    return self
  }
}
