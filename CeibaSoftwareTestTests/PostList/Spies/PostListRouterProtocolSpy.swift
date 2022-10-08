//
//  PostListRouterProtocolSpy.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest

class PostListRouterProtocolSpy: PostListRouterProtocol {
    // MARK: - Properties
    var currentViewController: PostListViewController?
    var didRouteToBack = false
    var didRouteToErrorGeneric = false
    
    // MARK: - Functions
    
    func routeToBack() {
        self.didRouteToBack = true
    }
    
    func routeToErrorGeneric() {
        self.didRouteToErrorGeneric = true
    }
    
}
