//
//  HomeScreenChannel.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation

protocol HomeScreenObserver: AnyObject {
  func onViewDidLoad()
  func onViewWillAppear()
  func onViewDidAppear()
  func onViewWillDisappear()
}

final class HomeScreenChannel: Channel<HomeScreenObserver> {

  func notifyOnViewDidLoad() {
    observers.forEach { $0.onViewDidLoad() }
  }

  func notifyOnViewWillAppear() {
    observers.forEach { $0.onViewWillAppear() }
  }

  func notifyOnViewDidAppear() {
    observers.forEach { $0.onViewDidAppear() }
  }

  func notifyOnViewWillDisappear() {
    observers.forEach { $0.onViewWillDisappear() }
  }

}

extension HomeScreenObserver {
  func onViewDidLoad() {}
  func onViewWillAppear() {}
  func onViewDidAppear() {}
  func onViewWillDisappear() {}
}
