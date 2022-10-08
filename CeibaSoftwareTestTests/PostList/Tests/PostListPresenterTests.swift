//
//  PostListPresenterTests.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class PostListPresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: PostListPresenter!
    var spyView: PostListViewProtocolSpy!
    var spyInteractor: PostListInteractorProtocolSpy!
    var spyRouter: PostListRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupPostListPresenter()
    }
    
    override  func tearDown() {
        spyInteractor = nil
        spyView = nil
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupPostListPresenter() {
        spyInteractor = PostListInteractorProtocolSpy()
        spyView = PostListViewProtocolSpy()
        spyRouter = PostListRouterProtocolSpy()
        sut = PostListPresenter(withViewController: spyView, andRouter: spyRouter, useCase: spyInteractor)
        sut.interactor = spyInteractor
        sut.router = spyRouter
        sut.view = spyView
    }
    
    // MARK: - Tests
    func testGetPostList() {
        // Given
        let userId: Int = 0
        // When
        sut.getPostList(userId: userId)
        //Then
        XCTAssertNoThrow(sut.getPostList(userId: userId), "getPostList executed")
        XCTAssertTrue(spyView.didShowProgressView, "didShowProgressView executed")
        XCTAssertNoThrow(spyInteractor.didGetPostList)
    }
    
    func testDidShowPostList() {
        // Given
        let postList: [PostResponse] = [PostResponse]()
        let userId: Int = 0
        // When
        sut.didShowPostList(postList: postList, userId: userId)
        // Then
        XCTAssertNoThrow(sut.didShowPostList(postList: postList, userId: userId), "didShowPostList executed")
        XCTAssertTrue(spyView.didHideProgressView, "didShowProgressView executed")
        XCTAssertTrue(spyView.didShowListPost, "didShowListPost executed")
    }
    
    func testGoToBack() {
        // Given
        // When
        sut.goToBack()
        // Then
        XCTAssertNoThrow(sut.goToBack(), "goToBack executed")
        XCTAssertTrue(spyRouter.didRouteToBack, "didRouteToBack executed")
    }
    
    func testGoToErrorGeneric() {
        // Given
        // When
        sut.goToErrorGeneric()
        // Then
        XCTAssertNoThrow(sut.goToErrorGeneric(), "goToErrorGeneric executed")
        XCTAssertTrue(spyRouter.didRouteToErrorGeneric, "didRouteToErrorGeneric executed")
    }
    
}
