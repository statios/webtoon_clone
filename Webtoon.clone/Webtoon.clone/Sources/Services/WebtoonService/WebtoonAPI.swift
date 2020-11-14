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
    case .splash:
      let path = Bundle.main.path(forResource: "Splash", ofType: "json")!
      let url = URL(fileURLWithPath: path)
      let data = try! Data(contentsOf: url)
      return data
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


