//
//  MainTabBarContoller.swift
//  TuneTon
//
//  Created by Artem Rodionov on 29.05.2024.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case search
    case library
}

final class MainTabBarContoller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        configureAppearance()
    }
    
    private func configureAppearance() {
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.backgroundColor = R.Colors.background
        
        // Overlining
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        
        // Generate ViewController
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            
            return controller
        }
        
        setViewControllers(controllers, animated: false)
    }
        
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .search: return SearchViewController()
        case .library: return ViewController()
        }
    }
}
