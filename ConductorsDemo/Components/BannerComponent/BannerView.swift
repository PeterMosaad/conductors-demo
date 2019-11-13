//
//  BannerView.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation
import UIKit

struct BannerViewViewModel {
  let color: UIColor
  let title: String
}

final class BannerView: UIView {

  @IBOutlet private weak var coloredRect: UIView!
  @IBOutlet private weak var actionButton: UIButton!
  var onButtonClicked: (() -> Void)?

  func update(with viewModel: BannerViewViewModel) {
    coloredRect.backgroundColor = viewModel.color
    actionButton.setTitle(viewModel.title, for: .normal)
  }

  @IBAction private func actionButtonClicked() {
    onButtonClicked?()
  }
}
