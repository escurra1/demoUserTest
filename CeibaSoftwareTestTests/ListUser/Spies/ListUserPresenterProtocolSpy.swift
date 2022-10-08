//
//  ListUserPresenterProtocolSpy.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class ListUserPresenterProtocolSpy: ListUserPresenterProtocol {
    // MARK: - Properties
    var didShowListUser = false
    var didGetListUsers = false
    var didGoToPostList = false
    var didGoToErrorGeneric = false
    var listUser: [UserResponse]?
    
    // MARK: - Functions
    func didShowListUser(listUser: [UserResponse]) {
        self.didShowListUser = true
        self.listUser = listUser
    }
    
    func getListUsers() {
        self.didGetListUsers = true
    }
    
    func goToPostList() {
        self.didGoToPostList = true
    }
    
    func goToErrorGeneric() {
        self.didGoToErrorGeneric = true
    }
    
}
