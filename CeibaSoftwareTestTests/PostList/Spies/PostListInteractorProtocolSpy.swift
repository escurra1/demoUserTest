//
//  PostListInteractorProtocolSpy.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class PostListInteractorProtocolSpy: PostListInteractorProtocol {
    // MARK: - Properties
    var presenter: PostListPresenterProtocol?
    var didGetPostList = false
    var userIdGet: Int = 0
    var title: String = ""
    var body: String = ""
    var id: Int = 0
    var userId: Int = 0
    
    // MARK: - Functions
    func getPostList(userId: Int) {
        self.didGetPostList = true
        self.userIdGet = userId
    }
    
}
