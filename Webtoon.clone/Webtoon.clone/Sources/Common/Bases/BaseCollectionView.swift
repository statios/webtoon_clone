//
//  BaseCollectionView.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit

class BaseCollectionView: UICollectionView {
  
  var flowLayout: UICollectionViewFlowLayout? {
    return collectionViewLayout as? UICollectionViewFlowLayout
  }
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    setupUI()
    setupBinding()
  }
  
  init() {
    super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    setupUI()
    setupBinding()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
    setupBinding()
  }
  
  @objc dynamic func setupUI() {
    backgroundColor = Color.white
    keyboardDismissMode = .onDrag
    allowsSelection = true
  }
  
  @objc dynamic func setupBinding() {
    
  }
}
