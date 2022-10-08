//
//  Constants.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation

struct Constants {
    struct Urls {
        static let baseUrl = "https://jsonplaceholder.typicode.com"
        static let users = "/users"
        static let posts = "/posts?userId="
    }
    
    struct ViewControllers {
        static let listUserViewController = "ListUserViewController"
        static let postListViewController = "PostListViewController"
        static let errorGenericViewController = "ErrorGenericViewController"
    }
    
    struct Storyboards {
        static let userStoryboard = "UserDesign"
        static let postStoryboard = "PostDesign"
    }
    
    struct Cells {
        static let listUserCell = "ListUserTableViewCell"
        static let listPostCell = "PostListTableViewCell"
        static let rowHeightListUserCell: CGFloat = 100.0
        static let rowHeightPostListCell: CGFloat = 158.0
    }
    
    struct Pattern {
        static let characterAllow = "^[A-Za-z0-9Ñ-ñ,-á-é-í-ó-ú-Á-É-Í-Ó-Ú.-; ]+$"
        static let scriptLine = "-"
        static let charactersNotAllowed = """
                [$&+€~£¥•¢{}≠´∞¬÷:;=¿?@#|'/_<>^*()%¡!]""
                """
    }
    
}
