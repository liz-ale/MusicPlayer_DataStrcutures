//
//  SearchViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by julian.garcia on 22/07/24.
//

import UIKit
import Combine

class SearchViewController: UITableViewController {
    
    private let viewModel: SearchViewModel
    
    private var cancellables = Set<AnyCancellable>()
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, String> = {
            // configure and return cell
        UITableViewDiffableDataSource<Int, String>(tableView: tableView) { (
            tableView: UITableView,
            indexPath: IndexPath,
            itemIdentifier: String
        ) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var content = cell.defaultContentConfiguration()
                
            content.text = itemIdentifier
            cell.contentConfiguration = content
            return cell
        }
    }()
    
    private let searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.loadViewIfNeeded()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        
        return searchController
    }()
    
    private let emptyTextLabel: UILabel = {
        let textView = UILabel()
        textView.text = "Search music!"
        textView.textAlignment = .center
        return textView
    }()
    
    init(viewModel: SearchViewModel) {
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
    
    private func setupView() {
        title = "Search"
        
        // search controller
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // empty text
        tableView.backgroundView = emptyTextLabel
        
        // tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //la vista en hilo principal
    //con cancelables se desuscriben los ubjetos
    private func setupBindings() {
        viewModel.$filteredResults
            .receive(on: DispatchQueue.main)
            .sink { [weak self] artists in
                self?.emptyTextLabel.isHidden = !artists.isEmpty
                self?.applySnapshot(artists)
            }
        //cuando se deje de iutilizar se desuscriba
            .store(in: &cancellables)
    }
    
    //se asignan los datos que recogio mi objeto diffable data source al snapshot
    //aqui se esta actualizando la tabla
    func applySnapshot(_ items: [String]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(items)
        dataSource.apply(snapshot)
    }
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBarText = searchController.searchBar.text!
        
        viewModel.filterWith(text: searchBarText)
    }
}
