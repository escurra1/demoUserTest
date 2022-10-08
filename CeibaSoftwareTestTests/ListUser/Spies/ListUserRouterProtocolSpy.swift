//
//  ListUserRouterProtocolSpy.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class ListUserRouterProtocolSpy: ListUserRouterProtocol {
    // MARK: - Properties
    var currentViewController: ListUserViewController?
    var didRouteToPostList = false
    var didRouteToErrorGeneric = false
    
    // MARK: - Functions
    func routeToPostList() {
        self.didRouteToPostList = true
    }
    
    func routeToErrorGeneric() {
        self.didRouteToErrorGeneric = true
    }
    
}
