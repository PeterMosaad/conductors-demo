//
//  NavigationBarComponent+Communication.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad Selim Abdelsaid on 19.05.20.
//  Copyright © 2020 Peter Mosaad. All rights reserved.
//

import Foundation

extension NavigationBarComponent: TimerComponentObserver {
  func timerDidStop() {
    update()
  }

  func timerDidTick() {
    update()
  }
}

extension NavigationBarComponent: BannerComponentObserver {
  func bannerButtonClicked() {
    update()
  }
}

extension NavigationBarComponent: HomeScreenObserver {
  func onViewWillAppear() {
    update()
  }
}
