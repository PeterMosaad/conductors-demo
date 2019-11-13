//
//  NavigationBarChannel.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation

protocol NavigationBarComponentObserver {
  func navigationButtonClicked()
}

final class NavigationBarComponentChannel: Channel<NavigationBarComponentObserver> {

}

extension NavigationBarComponentChannel: NavigationBarComponentDelegate {
  func buttonClicked() {
    observers.forEach { $0.navigationButtonClicked() }
  }
}
