//
//  BaseService.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

class BaseService {
  init() {
    Log.verbose(String(describing: Self.self))
  }
  deinit {
    Log.verbose(String(describing: Self.self))
  }
}
