//
//  PostListInteractorTests.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class PostListInteractorTests: XCTestCase {
    // MARK: Subject under test
    var sut: PostListInteractor!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupPostListInteractor()
    }
    
    override  func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupPostListInteractor() {
        sut = PostListInteractor()
    }
    
    // MARK: Tests
    func testGetPostList() {
        // Given
        let userId: Int = 0
        // When
        sut.getPostList(userId: userId)
        //Then
        XCTAssertNoThrow(sut.getPostList(userId: userId), "getPostList executed")
    }
    
}
