//
//  TestCellView.swift
//  TuneTon
//
//  Created by Artem Rodionov on 05.06.2024.
//

import UIKit

final class SearchCellView: UICollectionViewCell {
    static let id = "SearchCellView"
    
    
    private let albumCoverView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "album")
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let trackName: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let artistName: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func configure(with trackName: String, artistName: String) {
        self.trackName.text = trackName
        self.artistName.text = artistName
    }
}


private extension SearchCellView {
    func setupViews() {
        
        setupView(albumCoverView)
        setupView(stackView)
        stackView.addArrangedSubview(trackName)
        stackView.addArrangedSubview(artistName)
    }
    
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            albumCoverView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            albumCoverView.centerYAnchor.constraint(equalTo: centerYAnchor),
            albumCoverView.heightAnchor.constraint(equalToConstant: 43),
            albumCoverView.widthAnchor.constraint(equalTo: albumCoverView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: albumCoverView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor,  constant: -15)
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = R.Colors.separator.cgColor
    }
}
