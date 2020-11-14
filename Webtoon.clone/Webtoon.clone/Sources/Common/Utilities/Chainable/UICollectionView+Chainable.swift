//
//  UICollectionView+Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

extension Chain where Origin: UICollectionView {
  @discardableResult
  func register(_ cellType: UICollectionViewCell.Type) -> Chain {
    self.origin.register(cellType,
                         forCellWithReuseIdentifier: cellType.className)
    return self
  }
  
  @discardableResult
  func isPagingEnabled(_ canPaging: Bool) -> Chain {
    self.origin.isPagingEnabled = canPaging
    return self
  }
  
  @discardableResult
  func showsHorizontalScrollIndicator(_ show: Bool) -> Chain {
    self.origin.showsHorizontalScrollIndicator = show
    return self
  }
  
  @discardableResult
  func showsVerticalScrollIndicator(_ show: Bool) -> Chain {
    self.origin.showsVerticalScrollIndicator = show
    return self
  }
  
  @discardableResult
  func bounces(_ bounces: Bool) -> Chain {
    self.origin.bounces = bounces
    return self
  }
}

