//
//  Constants.swift
//  GHFollowers
//
//  Created by Daria on 26.02.2024.
//

import Foundation
import UIKit

enum Resources {
    
    enum SFSymbols {
        static let location  = "mappin.square.fill"
        static let repos     = "folder.fill"
        static let gists     = "text.justify"
        static let followers = "heart.fill"
        static let following = "person.2.fill"
    }
    
    enum ImageTitle {
        static let ghLogo            = "gh-logo"
        static let emptyStateLogo    = "empty-state-logo"
        static let avatarPlaceholder = "avatar-placeholder"
    }
    
    enum ScreenSize {
        static let width     = UIScreen.main.bounds.size.width
        static let height    = UIScreen.main.bounds.size.height
        static let maxLength = max(ScreenSize.width, ScreenSize.height)
        static let minLength = min(ScreenSize.width, ScreenSize.height)
        
    }
}
