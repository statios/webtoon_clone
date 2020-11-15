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
  case webtoonList(weekday: Int)
}

extension WebtoonAPI: TargetType {
  
  var baseURL: URL { //fake
    return URL(string: "http://api.webtoon.com")!
  }
  
  var path: String { //fake
    switch self {
    case .splash: return "/splash"
    case .webtoonList: return "/webtoon/list"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .splash: return .get
    case .webtoonList: return .get
    }
  }
  
  var sampleData: Data {
    switch self {
    case .splash: return getSampleData(name: "splash")
    case .webtoonList: return getSampleData(name: "webtoonList")
    }
  }
  
  var task: Task {
    switch self {
    case .splash: return .requestPlain
    case .webtoonList(let weekday): return .requestParameters(
      parameters: ["weekday": weekday],
      encoding: JSONEncoding.default)
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
