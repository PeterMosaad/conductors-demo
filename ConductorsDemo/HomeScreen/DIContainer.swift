//
//  DIContainer.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad Selim Abdelsaid on 19.05.20.
//  Copyright © 2020 Peter Mosaad. All rights reserved.
//

import Foundation

private class DataCenter {
  var counter: Int = 0
  var isRunning: Bool = false
}

final class DIContainer {

  private let data = DataCenter()
}

extension DIContainer: HomeScreenDIContainer  {
  var homeScreenDataProvider: HomeScreenDataProvider {
    return data
  }

  var timerDataProvider: TimerDataProvider {
    return data
  }

  var navigationDataProvider: NavigationBarComponentDataProvider {
    return data
  }

  var bannerDataProvider: BannerDataProvider {
    return data
  }
}

extension DataCenter: HomeScreenDataProvider { }

extension DataCenter: TimerDataProvider { }

extension DataCenter: NavigationBarComponentDataProvider { }

extension DataCenter: BannerDataProvider {
  var count: Int {
    return counter
  }
}
