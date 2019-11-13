//
//  HomeScreenConductor.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation

class HomeScreenConductor {

  let homeScreenChannel = HomeScreenChannel()

  private let navigationBarChannel = NavigationBarComponentChannel()
  private let bannerChannel = BannerComponentChannel()
  private let timerChannel = TimerComponentChannel()

  private var timerComponent: TimerComponent?
  private var navigationBarComponent: NavigationBarComponent?
  private var bannerComponent: BannerComponent?

  private let componentsFactory: HomeScreenComponentsFactory
  private let diContainer: HomeScreenDIContainer
  private let containerViewController: HomeScreenView


  init(
    componentsFactory: HomeScreenComponentsFactory,
    diContainer: HomeScreenDIContainer,
    containerViewController: HomeScreenView
  ) {
    self.componentsFactory = componentsFactory
    self.diContainer = diContainer
    self.containerViewController = containerViewController
  }

  func start(presenter: HomeScreenPresenter, bannerView: BannerView) {

    navigationBarChannel.register(observer: presenter)
    bannerChannel.register(observer: presenter)
    timerChannel.register(observer: presenter)

    timerComponent = componentsFactory.timerComponent(delegate: timerChannel)
    bannerChannel.register(observer: timerComponent!)
    navigationBarChannel.register(observer: timerComponent!)

    navigationBarComponent = componentsFactory.navigationBarComponent(delegate: navigationBarChannel)
    timerChannel.register(observer: navigationBarComponent!)
    bannerChannel.register(observer: navigationBarComponent!)
    homeScreenChannel.register(observer: navigationBarComponent!)

    bannerComponent = componentsFactory.bannerComponent(view: bannerView, delegate: bannerChannel)
    timerChannel.register(observer: bannerComponent!)
    navigationBarChannel.register(observer: bannerComponent!)
    homeScreenChannel.register(observer: bannerComponent!)

    presenter.setup(with: navigationBarComponent!.view)
  }
}
