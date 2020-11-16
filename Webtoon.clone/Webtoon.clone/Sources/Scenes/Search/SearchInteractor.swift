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
  func resetSearchHistory()
  func removeSearchHistory(_ index: Int)
  func requestSearch(_ keyword: String) -> Single<WebtoonResponse<[Webtoon]>>
}

final class SearchInteractor: BaseInteractor, SearchInteractable {
  @Injected var userDefaultService: UserDefaultServiceType
  @Injected var webtoonService: WebtoonServiceType
  
  func addSearchHistory(_ keyword: String) {
    guard userDefaultService.searchHistory.filter({ $0 == keyword }).isEmpty else {
      return
    }
    userDefaultService.searchHistory.insert(keyword, at: 0)
  }
  
  func getSearchHistory() -> [String] {
    userDefaultService.searchHistory
  }
  
  func removeSearchHistory(_ index: Int) {
    userDefaultService.searchHistory.remove(at: index)
  }
  
  func resetSearchHistory() {
    userDefaultService.searchHistory.removeAll()
  }
  
  func requestSearch(_ keyword: String)
  -> Single<WebtoonResponse<[Webtoon]>> {
    webtoonService.request(to: .search(keyword: keyword), type: [Webtoon].self)
  }
}
