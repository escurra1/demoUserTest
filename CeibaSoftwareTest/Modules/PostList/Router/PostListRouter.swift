//
//  PostListRouter.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation
import UIKit

protocol PostListRouterProtocol: AnyObject {
    var currentViewController: PostListViewController? {get set}
    func routeToBack()
    func routeToErrorGeneric()
}

class PostListRouter: PostListRouterProtocol {
    weak var currentViewController: PostListViewController?
    let storyBoardUser = UIStoryboard(name: Constants.Storyboards.userStoryboard, bundle: nil)
    
    init(evaluationView viewController: PostListViewController) {
        self.currentViewController = viewController
    }
    
    func routeToBack() {
        guard let navigationController = currentViewController?.navigationController
        else {
            return
        }
        navigationController.popViewController(animated: true)
    }
    
    func routeToErrorGeneric() {
        guard let navigationController = currentViewController?.navigationController, let viewController = storyBoardUser.instantiateViewController(withIdentifier: Constants.ViewControllers.errorGenericViewController) as? ErrorGenericViewController
        else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
