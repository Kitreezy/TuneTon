//
//  BaseController.swift
//  TuneTon
//
//  Created by Artem Rodionov on 30.05.2024.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    
}

// MARK: - Default Methods for views
@objc extension BaseController {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureAppearence() {
        view.backgroundColor = R.Colors.background
    }
    
}
