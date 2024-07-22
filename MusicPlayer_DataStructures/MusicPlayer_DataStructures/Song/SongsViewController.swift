//
//  SongsViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import Combine
import UIKit

class SongsViewController: UITableViewController {
    private let viewModel: SongsViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, Song> = {
        UITableViewDiffableDataSource<Int, Song>(tableView: tableView) { tableView, indexPath, song in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "\(song.title) - \(song.duration)"
            cell.contentConfiguration = content
            return cell
        }
    }()
    
    init(songViewModel: SongsViewModel) {
        self.viewModel = songViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    func setupView() {
        title = "Songs"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func applySnapshot(_ songs: [Song]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int,Song>()
        snapshot.appendSections([0])
        snapshot.appendItems(songs)
        dataSource.apply(snapshot)
    }
    
    private func setupBindings() {
        viewModel.$songs
            .print()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] songs in
                self?.applySnapshot(songs)
            }
            .store(in: &cancellables)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let song = dataSource.itemIdentifier(for: indexPath) else { return nil }
        let favAction = UIContextualAction(style: .normal, title: nil) {_, _, completion in
            //para insertar la cancion marcada como favorita
            FavoriteSongsViewModel.shared.addSong(song)
            completion(true)
        }
        favAction.image = UIImage(systemName: "heart.circle.fill")
        favAction.backgroundColor = .systemPink
        
        return UISwipeActionsConfiguration(actions: [favAction])
    }
}

