//
//  ListUserPresenter.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation

protocol ListUserPresenterProtocol: AnyObject {
    func didShowListUser(listUser: [UserResponse])
    func getListUsers()
    func goToPostList()
    func goToErrorGeneric()
}

class ListUserPresenter: ListUserPresenterProtocol {
    weak var view: ListUserViewProtocol?
    var router: ListUserRouterProtocol?
    var interactor: ListUserInteractorProtocol?
    
    init(withViewController view: ListUserViewProtocol?, andRouter router: ListUserRouterProtocol?, useCase interactor: ListUserInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getListUsers() {
        guard Utils.checkInternetConnection() else {
            goToErrorGeneric()
            return
        }
        view?.showProgressView()
        interactor?.getListUsers()
    }
    
    func didShowListUser(listUser: [UserResponse]) {
        view?.hideProgressView()
        view?.showListUser(user: listUser)
    }
    
    func goToPostList() {
        router?.routeToPostList()
    }
    
    func goToErrorGeneric() {
        view?.hideProgressView()
        router?.routeToErrorGeneric()
    }
    
}
