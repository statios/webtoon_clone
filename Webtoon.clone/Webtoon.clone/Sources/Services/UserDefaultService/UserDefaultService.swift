//
//  UserDefaultService.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import Foundation
import Resolver

protocol UserDefaultServiceType {
  var searchHistory: [String] { get set }
}

final class UserDefaultService: UserDefaultServiceType {
  @UserDefault(key: .searchHistory, defaultValue: [String]()) var searchHistory
}
