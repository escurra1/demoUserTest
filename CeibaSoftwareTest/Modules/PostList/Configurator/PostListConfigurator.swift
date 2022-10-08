//
//  PostListConfigurator.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation

protocol PostListConfiguratorProtocol: AnyObject {
    func configurePostListView(viewController: PostListViewController)
}

class PostListConfigurator: PostListConfiguratorProtocol {
    func configurePostListView(viewController: PostListViewController) {
        let router = PostListRouter(evaluationView: viewController)
        let interactor = PostListInteractor()
        let presenter = PostListPresenter(withViewController: viewController, andRouter: router, useCase: interactor)
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        presenter.interactor?.presenter = presenter
        viewController.presenter = presenter
    }
}
