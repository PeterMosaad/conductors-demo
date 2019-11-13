//
//  Channel.swift
//  ConductorsDemo
//
//  Created by Peter Mosaad on 12.11.19.
//  Copyright © 2019 Peter Mosaad. All rights reserved.
//

import Foundation

private protocol WeakRefContainer: AnyObject {
  var val: Any? { get }
}

private class WeakRef<T>: WeakRefContainer where T: AnyObject {
  private(set) weak var value: T?

  init(value: T) {
    self.value = value
  }

  var val: Any? {
    return value
  }
}

class Channel<T> {
  private var weakObservers: [WeakRefContainer] = []

  final var observers: [T] {
    return weakObservers.compactMap {
      return $0.val as? T
    }
  }

  final func register(observer: T) {
    weakObservers.append(WeakRef(value: observer as AnyObject))
  }

  final func unregister(observer: T) {
    weakObservers = weakObservers.filter {
      let value = $0.val as AnyObject
      let observer = observer as AnyObject
      return value !== observer
    }
  }
}
