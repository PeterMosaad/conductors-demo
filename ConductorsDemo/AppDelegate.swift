//
//  AppDelegate.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let router = HomeScreenRouter()
    window = UIWindow(frame: UIScreen.main.bounds)
    guard let window = window else { return true }
    router.start(with: window)
    window.makeKeyAndVisible()
    return true
  }
}

