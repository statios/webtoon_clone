//
//  SearchInteractor.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import Resolver
import RxCocoa
import RxSwift

protocol SearchInteractable {
  func addSearchHistory(_ keyword: String)
  func getSearchHistory() -> [String]
}

final class SearchInteractor: BaseInteractor, SearchInteractable {
  @Injected var userDefaultService: UserDefaultServiceType
  @Injected var webtoonService: WebtoonServiceType
  
  func addSearchHistory(_ keyword: String) {
    guard userDefaultService.searchHistory.filter({ $0 == keyword }).isEmpty else { return }
    userDefaultService.searchHistory.append(keyword)
  }
  
  func getSearchHistory() -> [String] {
    Array(userDefaultService.searchHistory)
  }
  
  func resetSearchHistory() {
    userDefaultService.searchHistory.removeAll()
  }
}
