//
//  BaseImageView.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import Foundation
import UIKit
import RxSwift
import Kingfisher

class BaseImageView: UIImageView {
  
  var disposeBag = DisposeBag()
  
  init() {
    super.init(frame: .zero)
    setupUI()
    setupBinding()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupBinding()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc dynamic func setupUI() {
    kf.indicatorType = .activity
  }
  
  @objc dynamic func setupBinding() {
    
  }
}

