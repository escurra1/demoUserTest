//
//  ListUserConfigurator.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation

protocol ListUserConfiguratorProtocol: AnyObject {
    func configureListUserView(viewController: ListUserViewController)
}

class ListUserConfigurator: ListUserConfiguratorProtocol {
    func configureListUserView(viewController: ListUserViewController) {
        let router = ListUserRouter(evaluationView: viewController)
        let interactor = ListUserInteractor()
        let presenter = ListUserPresenter(withViewController: viewController, andRouter: router, useCase: interactor)
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        presenter.interactor?.presenter = presenter
        viewController.presenter = presenter
    }
}
