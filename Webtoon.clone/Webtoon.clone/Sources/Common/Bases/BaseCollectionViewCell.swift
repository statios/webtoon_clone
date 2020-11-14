//
//  BaseCollectionViewCell.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import RxSwift

class BaseCollectionViewCell: UICollectionViewCell {
  
  var disposeBag = DisposeBag()
  
  open override func prepareForReuse() {
    super.prepareForReuse()
    disposeBag = DisposeBag()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupBinding()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  @objc dynamic func setupUI() {

  }
  
  @objc dynamic func setupBinding() {
    
  }
}
