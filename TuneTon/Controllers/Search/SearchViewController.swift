//
//  TestViewController.swift
//  TuneTon
//
//  Created by Artem Rodionov on 05.06.2024.
//

import UIKit
import Alamofire

class SearchViewController: BaseController {
    
    var networkService = NetworkService()
    private var dataSource: [Track] = []
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constraintViews()
        configureAppearence()
        setupSearchBar()
    }
    
  
}

extension SearchViewController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(collectionView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func configureAppearence() {
        super.configureAppearence()
        
        collectionView.register(SearchCellView.self, forCellWithReuseIdentifier: SearchCellView.id)
        //Header mb search
//        collectionView.register(<#T##viewClass: AnyClass?##AnyClass?#>, forSupplementaryViewOfKind: <#T##String#>, withReuseIdentifier: <#T##String#>)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataSource = []
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCellView.id,
                                                            for: indexPath) as? SearchCellView else { return UICollectionViewCell() }
        
        let track = dataSource[indexPath.row]
        
        cell.configure(with: track.trackName ?? "", artistName: track.artistName, albumCoverView: track.artworkUrl100 ?? URL(fileURLWithPath: ""))
        return cell
    }
    // Headre mb search
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        <#code#>
//    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 75)
    }
    //Header mb search
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)
    }
}
// MARK: - UISeacrhBar
extension SearchViewController {
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func  searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.networkService.fetchTracks(searchText: searchText) { [weak self] (searchResults) in
                self?.dataSource = searchResults?.results ?? []
                self?.collectionView.reloadData()
            }
        }
    }
}
