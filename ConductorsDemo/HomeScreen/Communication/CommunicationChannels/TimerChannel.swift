//
//  TimerChannel.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation

protocol TimerComponentObserver {
  func timerDidTick()
  func timerDidStop()
}

final class TimerComponentChannel: Channel<TimerComponentObserver> {

}

extension TimerComponentChannel: TimerComponentDelegate {
  func didStop() {
    observers.forEach { $0.timerDidTick() }
  }

  func didTick() {
    observers.forEach { $0.timerDidTick() }
  }
}
