//
//  TimerComponent.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation

protocol TimerDataProvider {
  var isRunning: Bool { get }
}

protocol TimerComponentDelegate: class {
  func didTick()
  func didStop()
}

final class TimerComponent {

  private unowned var delegate: TimerComponentDelegate
  private let dataProvider: TimerDataProvider

  private var timer: Timer?

  init(dataProvider: TimerDataProvider, delegate: TimerComponentDelegate) {
    self.dataProvider = dataProvider
    self.delegate = delegate
  }

  private func initializeTimer() -> Timer {
    return Timer.scheduledTimer(
      withTimeInterval: 1,
      repeats: true,
      block: { [weak self] _ in
        self?.delegate.didTick()
    })
  }

  public func resetTimerState() {
    if timer == nil {
      timer = initializeTimer()
    } else {
      timer?.invalidate()
      timer = nil
      delegate.didStop()
    }
  }
}
