//
//  PostListRouterTests.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class PostListRouterTests: XCTestCase {
    // MARK: Subject under test
    var sut: PostListRouterProtocol!
    var currentViewController: PostListViewController!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupPostListRouter()
    }
    
    override  func tearDown() {
        sut = nil
        currentViewController = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupPostListRouter() {
        currentViewController = PostListViewController()
        sut = PostListRouter(evaluationView: currentViewController)
    }
    
    // MARK: - Tests
    func testRouteToBack() {
        // Given
        // When
        sut.routeToBack()
        // Then
        XCTAssertNoThrow(sut.currentViewController, "currentViewController executed")
        XCTAssertNoThrow(sut.routeToBack(), "routeToBack executed")
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
