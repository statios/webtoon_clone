//
//  WebtoonResponse.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Foundation

struct WebtoonResponse<T: Codable>: Codable {
  var code: Int
  var message: String?
  var data: T?
}

extension WebtoonResponse {
  var isSuccess: Bool {
    return code == 0
  }
}
