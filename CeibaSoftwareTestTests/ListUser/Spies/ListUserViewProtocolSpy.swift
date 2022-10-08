//
//  ListUserViewProtocolSpy.swift
//  CeibaSoftwareTestUITests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class ListUserViewProtocolSpy: ListUserViewProtocol {
    // MARK: - Properties
    var didShowListUser = false
    var didShowProgressView = false
    var didHideProgressView = false
    var user: [UserResponse]?
    
    // MARK: - Functions
    func showListUser(user: [UserResponse]) {
        self.didShowListUser = true
        self.user = user
    }
    
    func showProgressView() {
        self.didShowProgressView = true
    }
    
    func hideProgressView() {
        self.didHideProgressView = true
    }
    
}
