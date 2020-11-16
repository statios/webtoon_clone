//
//  UserDefault.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
  enum Key: String {
    case searchHistory = "search_history"
  }
  
  let userDefaults: UserDefaults
  let key: Key
  let defaultValue: T
  
  init(userDefaults: UserDefaults = UserDefaults.standard,
       key: Key,
       defaultValue: T) {
    self.userDefaults = userDefaults
    self.key = key
    self.defaultValue = defaultValue
  }
  
  var wrappedValue: T {
    get { return userDefaults.object(forKey: key.rawValue) as? T ?? defaultValue }
    set {
      Log.verbose("Save a UserDefault data at \(key)")
      userDefaults.set(newValue, forKey: key.rawValue)
    }
  }
}
