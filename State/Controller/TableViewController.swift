//
//  TableViewController.swift
//  State
//
//  Created by Bas Broek on 08/03/2018.
//  Copyright © 2018 Bas Broek. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  private var datasource: [Song] = []
  typealias StateType = State<[Song]>
  var state: StateType = .loading {
    didSet {
      handleState(state)
    }
  }

  func handleState(_ state: StateType) {
    switch state {
    case .loading:
      SongFetcher().fetchSongs { self.state = $0 }
    case let .data(songs):
      datasource.append(contentsOf: songs)
      tableView.reloadData()
    case let .failure(error):
      print(error) // show some error
    case .empty:
      () // show some empty view
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    state = .loading
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datasource.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "song", for: indexPath)
    let song = datasource[indexPath.row]
    cell.textLabel?.text = song.title
    cell.detailTextLabel?.text = song.artist

    return cell
  }
}
