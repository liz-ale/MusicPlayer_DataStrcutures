//
//  FavoritesViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import Combine
import UIKit

class FavoritesViewController: UITableViewController {
    private let viewModel = FavoriteSongsViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    
    //es una clase de UIKit que proporciona una manera moderna y eficiente de gestionar los datos de una UITableView
    //Este enfoque utiliza snapshots para representar el estado actual de los datos de la tabla
    private lazy var dataSource: UITableViewDiffableDataSource<Int, Song> = {
        UITableViewDiffableDataSource<Int, Song>(tableView: tableView) { tableView, indexPath, song in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "\(song.title) - \(song.duration)"
            cell.contentConfiguration = content
            return cell
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }

    func setupView() {
        title = "Favorites"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupBindings() {
        viewModel.$favSongs
            .receive(on: DispatchQueue.main)
            .map { Array($0) }
            .sink { [weak self] songs in
                self?.applySnapshot(songs)
            }
            .store(in: &cancellables)
    }
    
    //Se crea un snapshot (NSDiffableDataSourceSnapshot) y se añade una sección y algunos elementos.
    //El snapshot se aplica al dataSource, lo que actualiza la tabla 
    private func applySnapshot(_ songs: [Song]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int,Song>()
        snapshot.appendSections([0])
        snapshot.appendItems(songs)
        dataSource.apply(snapshot)
    }
}

