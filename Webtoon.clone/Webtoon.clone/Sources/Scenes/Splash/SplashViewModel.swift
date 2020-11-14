//
//  SplashViewModel.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import RxSwift
import RxCocoa

class SplashViewModel: BaseViewModel {
  struct Event {
    let onAppear: Observable<Void>
  }
  
  struct State {
    
  }
}

extension SplashViewModel {
  func reduce(event: Event) -> State {
    return State()
  }
}

extension SplashViewModel {
}

