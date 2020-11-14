//
//  WebtoonServiceType.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa
import RxMoya
import Alamofire

protocol WebtoonServiceType {
  var provider: NetworkProvider<WebtoonAPI> { get }
}

extension WebtoonServiceType {
  func request<T: Codable>(
    to router: WebtoonAPI,
    type: T.Type,
    isIndicator: Bool = false)
  -> Single<WebtoonResponse<T>> {
    return provider.rx.request(router)
      .showIndicator(isIndicator)
      .map(WebtoonResponse<T>.self)
  }
}
