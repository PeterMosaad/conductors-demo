//
//  BannerComponent+Communication.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad Selim Abdelsaid on 19.05.20.
//  Copyright © 2020 Peter Mosaad. All rights reserved.
//

import Foundation

extension BannerComponent: TimerComponentObserver {
  func timerDidStop() {
    updateView()
  }

  func timerDidTick() {
    updateView()
  }
}

extension BannerComponent: NavigationBarComponentObserver {
  func navigationButtonClicked() {
    updateView()
  }
}


extension BannerComponent: HomeScreenObserver {
  func onViewWillAppear() {
    updateView()
  }
}
