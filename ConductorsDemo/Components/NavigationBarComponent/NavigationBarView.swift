//
//  NavigationBarView.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation
import UIKit

struct NavigationBarViewViewModel {
  let counter: String
  let buttonTitle: String
}

final class NavigationBarView: UIView {

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var button: UIButton!

  var onButtonClicked: (() -> Void)?

  override var intrinsicContentSize: CGSize {
    return UIView.layoutFittingExpandedSize
  }

  static func initFromNib() -> NavigationBarView? {
    guard
      let views = Bundle.main.loadNibNamed("NavigationBarView", owner: nil, options: nil),
      let view = views.first as? NavigationBarView
    else {
      return nil
    }
    return view
  }

  func update(with viewModel: NavigationBarViewViewModel) {
    titleLabel.text = viewModel.counter
    button.setTitle(viewModel.buttonTitle, for: .normal)
  }

  @IBAction private func titleButtonClicked() {
    onButtonClicked?()
  }
}
