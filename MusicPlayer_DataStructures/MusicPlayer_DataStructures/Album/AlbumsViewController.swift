//
//  AlbumsViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import Combine
import UIKit

class AlbumsViewController: UITableViewController {
    //nos estamos suscribiendo al viewModel
    private let viewModel: AlbumsViewModel
    private var cancellables = Set<AnyCancellable>()
    
    init(viewModel: AlbumsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //fuente diffable para los datos
    //
    private lazy var dataSource: UITableViewDiffableDataSource<Int, Album> = {
        UITableViewDiffableDataSource<Int, Album>(tableView: tableView) { tableView, indexPath, album in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = album.title
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
        title = "Albums"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func applySnapshot(_ albums: [Album]) {
        //pasa los datos que recibimos al snapshot
        //snapshot los pasa a la fuente de datos
        //actualiza los datos de forma automatica
        var snapshot = NSDiffableDataSourceSnapshot<Int, Album>()
        snapshot.appendSections([0])
        snapshot.appendItems(albums)
        dataSource.apply(snapshot)
    }
    
    private func setupBindings() {
        //vista corre en hilo principal
        //si pantalla muere antes de que acabe la suscripcion
        //al guardarla con "cancellable" se borrara de memoria
        viewModel.$albums
            .receive(on: DispatchQueue.main)
        //
            .sink { [weak self] albums in
                self?.applySnapshot(albums)
            }
            .store(in: &cancellables)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let album = dataSource.itemIdentifier(for: indexPath) else { return }
        let songsViewModel = SongsViewModel(interactor: viewModel.interactor, artist: viewModel.currentArtist.name, album: album.title)
        let songsViewController = SongsViewController(songViewModel: songsViewModel)
        navigationController?.pushViewController(songsViewController, animated: true)
    }
}

