//
//  ArtistsViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import Combine
import UIKit

class ArtistsViewController: UITableViewController {
    private let viewModel: ArtistsViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, Artist> = {
        UITableViewDiffableDataSource<Int, Artist>(tableView: tableView) { tableView, indexPath, artist in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = artist.name
            cell.contentConfiguration = content
            return cell
        }
    }()
    
    init(viewModel: ArtistsViewModel) {
        self.viewModel = viewModel
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
    
    //la vista en hilo principal
    //con cancelables se desuscriben los ubjetos
    private func setupBindings() {
        viewModel.$artists
            .receive(on: DispatchQueue.main)
            .sink { [weak self] artists in
                self?.applySnapshot(artists)
            }
        //cuando se deje de iutilizar se desuscriba
            .store(in: &cancellables)
    }
    
    //se asignan los datos que recogio mi objeto diffable data source al snapshot
    //aqui se esta actualizando la tabla
    func applySnapshot(_ artists: [Artist]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Artist>()
        snapshot.appendSections([0])
        snapshot.appendItems(artists)
        dataSource.apply(snapshot)
    }
    
    func setupView() {
        title = "Artists"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let artist = dataSource.itemIdentifier(for: indexPath) else { return }
        //albums debe tener acceso al interactor
        //para que sepa que modelo va a presentar
        let albumsViewModel = AlbumsViewModel(artistInteractor: viewModel.interactor, artist: artist)
        let albumsViewController = AlbumsViewController(viewModel: albumsViewModel)
        navigationController?.pushViewController(albumsViewController, animated: true)
    }
}

