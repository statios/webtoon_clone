//
//  WebtoonListCell.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa
import UIKit

final class WebtoonListCell: BaseCollectionViewCell {
  struct Metric {
    static let imageHeight = CGFloat(Device.width / 3 - 16)
  }
  
  let webtoon = PublishRelay<Webtoon>()
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  private let ratingLabel = UILabel()
  private let authorLabel = UILabel()
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
    titleLabel.text = nil
    ratingLabel.text = nil
    authorLabel.text = nil
  }
  
  override func setupUI() {
    super.setupUI()
    contentView.asChainable()
      .border(color: Color.gray)
      .border(width: 0.5)
    
    authorLabel.asChainable()
      .font(Font.extraSmall)
      .color(Color.black)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.equalToSuperview().offset(Padding.small)
        make.bottom.equalToSuperview().offset(-Padding.extraSmall)
      }
    
    ratingLabel.asChainable()
      .font(Font.small)
      .color(Color.black)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.equalToSuperview().offset(Padding.small)
        make.bottom.equalTo(authorLabel.snp.top).offset(-Padding.extraSmall)
      }
    
    titleLabel.asChainable()
      .font(Font.small)
      .color(Color.black)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.equalToSuperview().offset(Padding.small)
        make.bottom.equalTo(ratingLabel.snp.top).offset(-Padding.extraSmall)
      }
    
    imageView.asChainable()
      .background(color: Color.empty)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.trailing.top.equalToSuperview()
        make.bottom.equalTo(titleLabel.snp.top).offset(-Padding.extraSmall)
      }
  }
  override func setupBinding() {
    super.setupBinding()
    webtoon.map { $0.title }
      .bind(to: titleLabel.rx.text)
      .disposed(by: disposeBag)
    
    webtoon.map { $0.rating }
      .bind(to: ratingLabel.rx.text)
      .disposed(by: disposeBag)
    
    webtoon.map { $0.author }
      .bind(to: authorLabel.rx.text)
      .disposed(by: disposeBag)
  }
}
