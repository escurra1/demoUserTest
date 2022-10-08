//
//  ListUserRouter.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation
import UIKit

protocol ListUserRouterProtocol: AnyObject {
    var currentViewController: ListUserViewController? {get set}
    func routeToPostList()
    func routeToErrorGeneric()
}

class ListUserRouter: ListUserRouterProtocol {
    weak var currentViewController: ListUserViewController?
    let storyBoardPost = UIStoryboard(name: Constants.Storyboards.postStoryboard, bundle: nil)
    let storyBoardUser = UIStoryboard(name: Constants.Storyboards.userStoryboard, bundle: nil)
    
    init(evaluationView viewController: ListUserViewController) {
        self.currentViewController = viewController
    }
    
    func routeToPostList() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardPost.instantiateViewController(withIdentifier: Constants.ViewControllers.postListViewController) as? PostListViewController
        else {
            return
        }
        viewController.listUserDetail = currentViewController?.listUserSelect
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToErrorGeneric() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardUser.instantiateViewController(withIdentifier: Constants.ViewControllers.errorGenericViewController) as? ErrorGenericViewController
        else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
