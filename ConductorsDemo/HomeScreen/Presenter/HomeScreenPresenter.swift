//
//  HomeScreenPresenter.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation
import UIKit

typealias HomeScreenView = HomeView & UIViewController

protocol HomeView: class {
  func setup(with navigationBar: NavigationBarView)
  func showLoading()
  func hideLoading()
}

protocol HomeScreenDataProvider {
  var isRunning: Bool { get set }
  var counter: Int { get set }
}

final class HomeScreenPresenter {

  private var dataProvider: HomeScreenDataProvider
  private unowned var view: HomeScreenView
  weak var router: HomeScreenRouting?
  private let conductor: HomeScreenConductor
  private var homeChannel: HomeScreenChannel {
    return conductor.homeScreenChannel
  }

  init(view: HomeScreenView, diContainer: HomeScreenDIContainer) {

    self.view = view

    let componentsFactory = HomeScreenComponentsFactory(
      diContainer: diContainer,
      containerViewController: view
    )
    self.conductor = HomeScreenConductor(
      componentsFactory: componentsFactory,
      diContainer: diContainer,
      containerViewController: view
    )
    self.dataProvider = diContainer.homeScreenDataProvider
  }

  func onViewDidLoad(with bannerView: BannerView) {
    conductor.start(presenter: self, bannerView: bannerView)
    homeChannel.notifyOnViewDidLoad()
  }

  func onViewWillAppear() {
    homeChannel.notifyOnViewWillAppear()
  }

  func notifyOnViewDidAppear() {
    homeChannel.notifyOnViewDidAppear()
  }

  func notifyOnViewWillDisappear() {
    homeChannel.notifyOnViewWillDisappear()
  }

  func setup(with navigationBar: NavigationBarView) {
    view.setup(with: navigationBar)
  }

}

extension HomeScreenPresenter: TimerComponentObserver {
  func timerDidStop() {
    dataProvider.isRunning = false
  }

  func timerDidTick() {
    dataProvider.counter += 1
  } 
}

extension HomeScreenPresenter: BannerComponentObserver {
  func bannerButtonClicked() {
    dataProvider.isRunning = !dataProvider.isRunning
    dataProvider.counter = 0
  }
}

extension HomeScreenPresenter: NavigationBarComponentObserver {
  func navigationButtonClicked() {
    dataProvider.isRunning = !dataProvider.isRunning
    dataProvider.counter = 0
  }
}
