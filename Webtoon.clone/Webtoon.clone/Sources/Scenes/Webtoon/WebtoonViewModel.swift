//
//  ListViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa
import Resolver

final class WebtoonViewModel: BaseViewModel {
  @Injected var webtoonInteractor: WebtoonInteractable
  
  struct Event {
    let currentPage: Observable<Int>
  }
  
  struct State {
    
  }
}

extension WebtoonViewModel {
  func reduce(event: Event) -> State {
    event.currentPage
      .bind(to: webtoonInteractor.currentPage)
      .disposed(by: disopseBag)
    return State()
  }
}

extension WebtoonViewModel {
}
