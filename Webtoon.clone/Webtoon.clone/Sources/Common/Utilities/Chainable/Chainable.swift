//
//  Chainable.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

class Chain<Origin> {
  var origin: Origin
  
  init(origin: Origin) {
    self.origin = origin
  }
}

protocol Chainable { }

extension Chainable {
  func asChainable() -> Chain<Self> {
    return Chain(origin: self)
  }
}
