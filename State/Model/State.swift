//
//  State.swift
//  State
//
//  Created by Bas Broek on 08/03/2018.
//  Copyright © 2018 Bas Broek. All rights reserved.
//

import Foundation

enum State<DataType: Equatable>: Equatable {
  case loading
  case data(DataType)
  case failure(Error)
  case empty

  static func ==(lhs: State, rhs: State) -> Bool {
    switch (lhs, rhs) {
    case let (.data(l), .data(r)):
      return l == r
    case let (.failure(l), .failure(r)):
      return l.localizedDescription == r.localizedDescription
    case (.loading, .loading), (.empty, .empty):
      return true
    // Make the switch exhaustive, and allow the compiler
    // to report an error when adding a new state.
    case (.data, _), (.failure, _), (.loading, _), (.empty, _):
      return false
    }
  }
}
