//
//  TimerComponent+Communication.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad Selim Abdelsaid on 19.05.20.
//  Copyright © 2020 Peter Mosaad. All rights reserved.
//

import Foundation

extension TimerComponent: BannerComponentObserver {
  func bannerButtonClicked() {
    resetTimerState()
  }
}

extension TimerComponent: NavigationBarComponentObserver {
  func navigationButtonClicked() {
    resetTimerState()
  }
}
