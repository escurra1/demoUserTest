//
//  PostListPresenterProtocolSpy.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class PostListPresenterProtocolSpy: PostListPresenterProtocol {
    // MARK: - Properties
    var didShowPostList = false
    var didGetPostList = false
    var didGoToBack = false
    var didGoToErrorGeneric = false
    var postList: [PostResponse]?
    var userId: Int?
    
    // MARK: - Functions
    func didShowPostList(postList: [PostResponse], userId: Int) {
        self.didShowPostList = true
        self.postList = postList
        self.userId = userId
    }
    
    func getPostList(userId: Int) {
        self.didGetPostList = true
        self.userId = userId
    }
    
    func goToBack() {
        self.didGoToBack = true
    }
    
    func goToErrorGeneric() {
        self.didGoToErrorGeneric = true
    }
}
