//
//  HomeScreenViewController.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import UIKit

final class HomeScreenViewController: UIViewController {

  @IBOutlet private weak var bannerView: BannerView!

  private(set) lazy var presenter: HomeScreenPresenter = {
    return HomeScreenPresenter(
      view: self,
      diContainer: DIContainer()
    )
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad(with: bannerView)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupAppearance()
    presenter.onViewWillAppear()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    presenter.notifyOnViewDidAppear()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    presenter.notifyOnViewWillDisappear()
  }

  private func setupAppearance() {
    navigationController?.navigationBar.barStyle = .default
  }
}

extension HomeScreenViewController: HomeView {
  func setup(with navigationBar: NavigationBarView) {

    navigationItem.titleView = navigationBar
    navigationBar.isUserInteractionEnabled = true
    navigationBar.layer.masksToBounds = false
  }

  func showLoading() {
    // Do it.
  }

  func hideLoading() {
    // Do it.
  }
}
