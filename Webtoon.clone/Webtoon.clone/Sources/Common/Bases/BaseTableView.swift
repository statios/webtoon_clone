//
//  BaseTableView.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import UIKit
import RxSwift
import RxCocoa

public class BaseTableView: UITableView {
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    setupUI()
    setupBinding()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
    setupBinding()
  }
  
  @objc dynamic func setupUI() {
    rowHeight = UITableView.automaticDimension
    estimatedRowHeight = 54
//    sectionHeaderHeight = 30
    keyboardDismissMode = .onDrag
//    tableFooterView = UIView()
    separatorStyle = .none
    backgroundColor = Color.white
  }
  
  @objc dynamic func setupBinding() {
    
  }
}
