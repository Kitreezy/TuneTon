//
//  BaseView.swift
//  TuneTon
//
//  Created by Artem Rodionov on 10.06.2024.
//

import UIKit

final class BaseView: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: \(coder) has not been implemented")
    }
}
// MARK: - Default methods for View
@objc extension BaseView {
    
    func setupViews() {}
    
    func constraintViews() {}
    
    func configureAppearence() {}
}
