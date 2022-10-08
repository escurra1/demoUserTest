//
//  ListUserInteractorTests.swift
//  CeibaSoftwareTestTests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class ListUserInteractorTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListUserInteractor!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListUserInteractor()
    }
    
    override  func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListUserInteractor() {
        sut = ListUserInteractor()
    }
    
    // MARK: Tests
    func testGetListUsers() {
        // Given
        // When
        sut.getListUsers()
        //Then
        XCTAssertNoThrow(sut.getListUsers(), "getListUsers executed")
    }
    
}
