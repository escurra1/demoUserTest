//
//  PostListPresenter.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation

protocol PostListPresenterProtocol: AnyObject {
    func didShowPostList(postList: [PostResponse], userId: Int)
    func getPostList(userId: Int)
    func goToBack()
    func goToErrorGeneric()
}

class PostListPresenter: PostListPresenterProtocol {
    weak var view: PostListViewProtocol?
    var router: PostListRouterProtocol?
    var interactor: PostListInteractorProtocol?
    
    init(withViewController view: PostListViewProtocol?, andRouter router: PostListRouterProtocol?, useCase interactor: PostListInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getPostList(userId: Int) {
        guard Utils.checkInternetConnection() else {
            goToErrorGeneric()
            return
        }
        view?.showProgressView()
        interactor?.getPostList(userId: userId)
    }
    
    func didShowPostList(postList: [PostResponse], userId: Int) {
        view?.hideProgressView()
        view?.showListPost(post: postList, userId: userId)
    }
    
    func goToBack() {
        router?.routeToBack()
    }
    
    func goToErrorGeneric() {
        view?.hideProgressView()
        router?.routeToErrorGeneric()
    }
    
}
