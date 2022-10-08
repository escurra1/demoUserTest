//
//  ListUserPresenterTests.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class ListUserPresenterTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListUserPresenter!
    var spyView: ListUserViewProtocolSpy!
    var spyInteractor: ListUserInteractorProtocolSpy!
    var spyRouter: ListUserRouterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListUserPresenter()
    }
    
    override  func tearDown() {
        spyInteractor = nil
        spyView = nil
        spyRouter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListUserPresenter() {
        spyInteractor = ListUserInteractorProtocolSpy()
        spyView = ListUserViewProtocolSpy()
        spyRouter = ListUserRouterProtocolSpy()
        sut = ListUserPresenter(withViewController: spyView, andRouter: spyRouter, useCase: spyInteractor)
        sut.interactor = spyInteractor
        sut.router = spyRouter
        sut.view = spyView
    }
    
    // MARK: - Tests
    func testGetListUsers() {
        // Given
        // When
        sut.getListUsers()
        //Then
        XCTAssertNoThrow(sut.getListUsers(), "getListUsers executed")
        XCTAssertTrue(spyView.didShowProgressView, "didShowProgressView executed")
        XCTAssertNoThrow(spyInteractor.getListUsers)
    }
    
    func testDidShowListUser() {
        // Given
        let listUser: [UserResponse] = [UserResponse]()
        // When
        sut.didShowListUser(listUser: listUser)
        // Then
        XCTAssertNoThrow(sut.didShowListUser(listUser: listUser), "didShowListUser executed")
        XCTAssertTrue(spyView.didHideProgressView, "didShowProgressView executed")
        XCTAssertTrue(spyView.didShowListUser, "didShowListPost executed")
    }
    
    func testGoToPostList() {
        // Given
        // When
        sut.goToPostList()
        // Then
        XCTAssertNoThrow(sut.goToPostList(), "goToPostList executed")
        XCTAssertTrue(spyRouter.didRouteToPostList, "didRouteToPostList executed")
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
