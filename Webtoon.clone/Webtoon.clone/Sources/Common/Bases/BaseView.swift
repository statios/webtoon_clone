//
//  BaseView.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/15.
//

import Foundation
import UIKit
import RxSwift

class BaseView: UIView {
  
  var disposeBag = DisposeBag()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
    setupBinding()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc dynamic func setupUI() {
    
  }
  
  @objc dynamic func setupBinding() {
    
  }
}

