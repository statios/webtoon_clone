//
//  AppDelegate.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import UIKit
import Resolver
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
  -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    AppNavigator.presentSplashScene(in: window)
    return true
  }
}

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    AppNavigator.registerServices()
    AppNavigator.registerSplashScene()
    SplashNavigator.registerSplashScenes()
    MainNavigator.registerMainScenes()
    WebtoonNavigator.registerWebtoonScenes()
    ChallengeNavigator.registerChallengeScenes()
  }
}

