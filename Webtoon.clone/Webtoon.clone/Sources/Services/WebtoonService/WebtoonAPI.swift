//
//  WebtoonAPI.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Foundation
import Moya

enum WebtoonAPI {
  case splash
}

extension WebtoonAPI: TargetType {
  
  var baseURL: URL { //fake
    return URL(string: "http://api.webtoon.com")!
  }
  
  var path: String { //fake
    switch self {
    case .splash: return "/splash"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .splash: return .get
    }
  }
  
  var sampleData: Data {
    switch self {
    case .splash: return getSampleData(name: "splash")
    }
  }
  
  var task: Task {
    switch self {
    case .splash: return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return [:]
  }
}

// Helpers
extension WebtoonAPI {
  private func getSampleData(name: String?) -> Data {
    guard let path = Bundle.main.path(forResource: name, ofType: "json") else { return Data() }
    let url = URL(fileURLWithPath: path)
    guard let data = try? Data(contentsOf: url) else { return Data() }
    return data
  }
}
