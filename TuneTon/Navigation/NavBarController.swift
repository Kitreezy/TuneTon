//
//  NavBarController.swift
//  TuneTon
//
//  Created by Artem Rodionov on 30.05.2024.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = UIColor(hexString: "151515")
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: R.Colors.titleGray,
            .font: R.Fonts.helveticaRegular(with: 17)
        ]
        navigationBar.addNavBarBorder(with: R.Colors.separator, height: 1)
    }
}
