//
//  ListUserRouterTests.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class ListUserRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListUserRouterProtocol!
    var currentViewController: ListUserViewController!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListUserRouter()
    }
    
    override  func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListUserRouter() {
        currentViewController = ListUserViewController()
        sut = ListUserRouter(evaluationView: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToPostList() {
        // Given
        // When
        sut.routeToPostList()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToPostList(), "routeToPostList executed")
    }
    
    func testRouteToErrorGeneric() {
        // Given
        // When
        sut.routeToErrorGeneric()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToErrorGeneric(), "routeToErrorGeneric executed")
    }
    
    
}
