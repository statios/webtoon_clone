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
  @Injected var navigator: AppNavigator
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
  -> Bool {
    window = navigator.root
    return true
  }
}
