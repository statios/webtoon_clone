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

typealias Empty = String

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
      .map(WebtoonResponse<T>.self)
  }
}
