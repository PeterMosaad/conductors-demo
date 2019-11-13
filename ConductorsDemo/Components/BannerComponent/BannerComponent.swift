//
//  BannerComponent.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation
import UIKit

protocol BannerComponentDelegate: class {
  func buttonClicked()
}

protocol BannerDataProvider {
  var count: Int { get }
  var isRunning: Bool { get }
}

final class BannerComponent {

  private let view: BannerView
  private let dataProvider: BannerDataProvider
  private unowned var delegate: BannerComponentDelegate

  init(
    view: BannerView,
    dataProvider: BannerDataProvider,
    delegate: BannerComponentDelegate
  ) {

    self.dataProvider = dataProvider
    self.delegate = delegate
    self.view = view

    self.view.onButtonClicked = { [unowned self] in
      self.onActionButtonClicked()
    }
  }

  public func updateView() {
    view.update(with: generateViewModel())
  }
}

private extension BannerComponent {
  func onActionButtonClicked() {
    delegate.buttonClicked()
  }

  func generateViewModel() -> BannerViewViewModel {
    let isRunning = dataProvider.isRunning
    let color: UIColor = isRunning ? dataProvider.count % 2 == 0 ? .red : .blue : .clear
    let title = isRunning ? "Stop" : "Start"
    return BannerViewViewModel(
      color: color,
      title: title
    )
  }
}
