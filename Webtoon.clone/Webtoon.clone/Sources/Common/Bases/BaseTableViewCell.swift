//
//  BaseTableViewCell.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell {
  
  var disposeBag = DisposeBag()
  
  open override func prepareForReuse() {
    super.prepareForReuse()
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
    setupBinding()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  @objc dynamic func setupUI() {
    selectionStyle = .none
  }
  
  @objc dynamic func setupBinding() {
    
  }
}

