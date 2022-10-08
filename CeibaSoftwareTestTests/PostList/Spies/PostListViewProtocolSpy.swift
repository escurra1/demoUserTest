//
//  PostListViewProtocolSpy.swift
//  CeibaSoftwareTestUITests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class PostListViewProtocolSpy: PostListViewProtocol {
    // MARK: - Properties
    var didShowListPost = false
    var didShowProgressView = false
    var didHideProgressView = false
    var post: [PostResponse]?
    var userId: Int = 0
    
    // MARK: - Functions
    func showListPost(post: [PostResponse], userId: Int) {
        self.didShowListPost = true
        self.post = post
        self.userId = userId
    }
    
    func showProgressView() {
        self.didShowProgressView = true
    }
    
    func hideProgressView() {
        self.didHideProgressView = true
    }
    
}
