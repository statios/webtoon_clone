//
//  ChallengeListCell.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import RxSwift
import RxCocoa
import UIKit

final class ChallengeListCell: BaseTableViewCell {
  
  struct Metric {
    static let thumbnailWidth = CGFloat(128)
  }
  
  private let thumbnailView = BaseImageView()
  private let titleLabel = UILabel()
  private let authorLabel = UILabel()
  private let introduceLabel = UILabel()
  private let ratingLabel = UILabel()
  private let dateLabel = UILabel()
  
  let challenge = PublishRelay<Challenge>()
}

extension ChallengeListCell {
  override func setupUI() {
    super.setupUI()
    contentView.asChainable()
      .border(color: Color.gray)
      .border(width: 0.5)
    
    thumbnailView.asChainable()
      .background(color: Color.empty)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.leading.top.equalToSuperview().offset(Padding.small)
        make.bottom.equalToSuperview().offset(-Padding.small)
        make.width.equalTo(Metric.thumbnailWidth)
      }
    
    titleLabel.asChainable()
      .color(Color.black)
      .font(Font.medium)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.top.equalToSuperview().offset(Padding.small)
        make.leading.equalTo(thumbnailView.snp.trailing).offset(Padding.small)
      }
    
    authorLabel.asChainable()
      .color(Color.black)
      .font(Font.small)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.top.equalTo(titleLabel.snp.bottom).offset(Padding.extraSmall)
        make.leading.equalTo(titleLabel)
      }
    
    introduceLabel.asChainable()
      .color(Color.black)
      .font(Font.small)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.top.equalTo(authorLabel.snp.bottom).offset(Padding.extraSmall)
        make.leading.equalTo(titleLabel)
      }
    
    ratingLabel.asChainable()
      .color(Color.black)
      .font(Font.extraSmall)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.top.equalTo(introduceLabel.snp.bottom).offset(Padding.extraSmall)
        make.leading.equalTo(titleLabel)
        make.bottom.equalToSuperview().offset(-Padding.small)
      }
    
    dateLabel.asChainable()
      .color(Color.black)
      .font(Font.extraSmall)
      .add(to: contentView)
      .makeConstraints { (make) in
        make.top.equalTo(ratingLabel)
        make.leading.equalTo(ratingLabel.snp.trailing).offset(Padding.small)
      }
  }
}

extension ChallengeListCell {
  override func setupBinding() {
    super.setupBinding()
    challenge.map { $0.title }
      .bind(to: titleLabel.rx.text)
      .disposed(by: disposeBag)
    
    challenge.map { $0.author }
      .bind(to: authorLabel.rx.text)
      .disposed(by: disposeBag)
    
    challenge.map { $0.introduce }
      .bind(to: introduceLabel.rx.text)
      .disposed(by: disposeBag)
    
    challenge.map { $0.rating }
      .bind(to: ratingLabel.rx.text)
      .disposed(by: disposeBag)
    
    challenge.map { $0.date }
      .bind(to: dateLabel.rx.text)
      .disposed(by: disposeBag)
  }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct ChallengeListCell_Preview: UIViewRepresentable, PreviewProvider {
  func makeUIView(context: Context) -> ChallengeListCell {
    ChallengeListCell()
  }

  func updateUIView(_ view: ChallengeListCell, context: Context) {
    view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    let challenge = Challenge(thumbnail: "",
                              title: "title",
                              author: "author",
                              introduce: "introduce",
                              rating: "rating",
                              date: "date")
    view.challenge.accept(challenge)
  }

  static var previews: some View {
    ChallengeListCell_Preview()
      .previewLayout(.fixed(width: Device.width, height: CGFloat(100)))
  }
}
#endif
