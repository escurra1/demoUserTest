//
//  ListUserInteractorProtocolSpy.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class ListUserInteractorProtocolSpy: ListUserInteractorProtocol {
    // MARK: - Properties
    var presenter: ListUserPresenterProtocol?
    var didGetListUsers = false
    
    // MARK: - Functions
    func getListUsers() {
        self.didGetListUsers = true
    }
    
}
