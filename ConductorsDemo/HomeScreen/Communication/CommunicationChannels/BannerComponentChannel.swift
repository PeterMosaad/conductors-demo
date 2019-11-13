//
//  BannerComponentChannel.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation

protocol BannerComponentObserver {
  func bannerButtonClicked()
}

final class BannerComponentChannel: Channel<BannerComponentObserver> {

}

extension BannerComponentChannel: BannerComponentDelegate {
  func buttonClicked() {
    observers.forEach { $0.bannerButtonClicked() }
  }
}
