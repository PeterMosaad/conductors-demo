//
//  HomeScreenRouter.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation
import UIKit

protocol HomeScreenRouting: class {
  func start(with window: UIWindow)
}

class HomeScreenRouter: HomeScreenRouting {

  private var homeScreenNavigationController: UINavigationController?

  private lazy var homeScreenViewController: HomeScreenViewController = {
    let homeScreenVC = HomeScreenViewController(nibName: "HomeScreenViewController", bundle: nil)
    homeScreenVC.presenter.router = self
    return homeScreenVC
  }()

  func start(with window: UIWindow) {
    homeScreenNavigationController = UINavigationController(rootViewController: homeScreenViewController)
    window.rootViewController = homeScreenNavigationController
  }
}
