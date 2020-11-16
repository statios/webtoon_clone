//
//  AppDelegate+Injection.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/16.
//

import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    registerNavigator()
    registerServices()
    registerScenes()
  }
}

extension Resolver {
  static func registerNavigator() {
    register { AppNavigator() }
      .scope(application)
  }
  
  static func registerServices() {
    register { UserDefaultService() }
      .implements(UserDefaultServiceType.self)
      .scope(application)
    #if DEBUG
    register { WebtoonSampleService() }
      .implements(WebtoonServiceType.self)
      .scope(application)
    #else
    register { WebtoonService() }
      .implements(WebtoonServiceType.self)
      .scope(application)
    #endif
  }
  
  static func registerScenes() {
    register { SplashViewModel() }
    register { SplashInteractor() }
      .implements(SplashInteractable.self)
      .scope(shared)
    
    register { MainViewModel() }
    
    register { WebtoonViewModel() }
    register { WebtoonInteractor() }
      .implements(WebtoonInteractable.self)
      .scope(shared)
    register { WebtoonListViewModel() }
    
    register { ChallengeViewModel() }
    register { ChallengeInteractor() }
      .implements(ChallengeInteractable.self)
      .scope(shared)
    register { ChallengeListViewModel() }
    
    register { SettingViewModel() }
    register { SettingInteractor() }
      .implements(SettingInteractable.self)
      .scope(shared)
    
    register { SearchViewModel() }
    register { SearchInteractor() }
      .implements(SearchInteractable.self)
      .scope(shared)
  }
}
