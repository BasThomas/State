//
//  SongFetcher.swift
//  State
//
//  Created by Bas Broek on 08/03/2018.
//  Copyright © 2018 Bas Broek. All rights reserved.
//

import Foundation

struct SongFetcher {
  func fetchSongs(completionHandler: (State<[Song]>) -> Void) {
    // We're opting for a happy path here, but we could also return
    // one of the other states here.
    let state = State.data([
      Song(artist: "Nils Frahm", title: "All Melody"),
      Song(artist: "Nils Frahm", title: "Sunson")
    ])
    // We can't exit this scope in a `.loading` state;
    // we need to return an actionable state.
    assert(state != .loading)
    completionHandler(state)
  }
}
