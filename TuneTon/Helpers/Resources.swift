//
//  Resources.swift
//  TuneTon
//
//  Created by Artem Rodionov on 30.05.2024.
//

import UIKit

enum R {
    // MARK: - Colors Section
    enum Colors {
        static let active = UIColor(hexString: "AF47D2")
        static let inactive = UIColor(hexString: "0E46A3")
        
        static let background = UIColor(hexString: "151515")
        static let separator = UIColor(hexString: "141E46")
        
        static let titleGray = UIColor(hexString: "#545C77")
    }
    
    // MARK: - Strings Section
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .search: return "Search"
                case .library: return "Library"
                }
            }
        }
    }
    
    // MARK: - Images Section
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .search: return UIImage(systemName: "magnifyingglass")
                case .library: return UIImage(systemName: "music.note.list")
                }
            }
        }
    }
    
    // MARK: - Fonts Section
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
