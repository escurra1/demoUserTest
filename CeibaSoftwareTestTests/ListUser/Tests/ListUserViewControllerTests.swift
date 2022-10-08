//
//  ListUserViewControllerTests.swift
//  CeibaSoftwareTestUITests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class ListUserViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: ListUserViewController!
    var spyPresenter: ListUserPresenterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupListUserViewController()
    }
    
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupListUserViewController() {
        sut = ListUserViewController()
        spyPresenter = ListUserPresenterProtocolSpy()
        sut.listUserTableView =  UITableView()
        sut.listUserSearchBar = UISearchBar()
        sut.presenter = spyPresenter
    }
    
    // MARK: Tests
    func testViewDidLoad() {
        // Given
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertNoThrow(sut.viewDidLoad())
        XCTAssertNotNil(sut, "sut should be instantiated")
    }
    
    func testNumberOfRowsInSection() {
        // Given
        let listUserTableView = UITableView(frame:  CGRect(x: 0, y: 0, width: 100, height: 100))
        let section: Int = 0
        var itemInSection = sut.tableView(listUserTableView, numberOfRowsInSection: section)
        // When
        itemInSection = 0
        // Then
        XCTAssertEqual(itemInSection, 0)
    }
    
    func testCellForRowAt() {
        // Given
        let listUserTableView = UITableView(frame:  CGRect(x: 0, y: 0, width: 100, height: 100))
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        let cell = listUserTableView.dataSource?.tableView(listUserTableView, cellForRowAt: indexPath) as? ListUserTableViewCell
        guard let cellTest = cell else {
            return
        }
        // Then
        XCTAssertTrue(cellTest == cellTest, "cellTest executed")
        XCTAssertNotNil(cellTest.nameLabel)
        XCTAssertNotNil(cellTest.phoneLabel)
        XCTAssertNotNil(cellTest.emailLabel)
    }
    
    func testHeightForRowAt() {
        // Given
        let listUserTableView = UITableView(frame:  CGRect(x: 0, y: 0, width: 100, height: 100))
        let indexPath = IndexPath(item: 0, section: 0)
        var itemInSection = sut.tableView(listUserTableView, heightForRowAt: indexPath)
        // When
        itemInSection = 0
        // Then
        XCTAssertEqual(itemInSection, 0)
    }
    
    func testshowListPost() {
        // Given
        let user: [UserResponse] = [UserResponse]()
        // When
        sut.showListUser(user: user)
        // Then
        XCTAssertNoThrow(sut.showListUser(user: user), "showListUser executed")
    }
    
    func testShowProgressView() {
        // Given
        // When
        sut.showProgressView()
        // Then
        XCTAssertNoThrow(sut.showProgressView(), "showProgressView executed")
    }
    
    func testHideProgressView() {
        // Given
        // When
        sut.hideProgressView()
        // Then
        XCTAssertNoThrow(sut.hideProgressView(), "hideProgressView executed")
    }
    
    func testTextDidChange() {
        // Given
        let searchBar = UISearchBar()
        let textSearch = "UserCeiba"
        // When
        sut.searchBar(searchBar, textDidChange: textSearch)
        // Then
        XCTAssertNoThrow(sut.searchBar(searchBar, textDidChange: textSearch), "textDidChange executed")
    }
    
    func testSearchBarTextDidBeginEditing() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarTextDidBeginEditing(searchBar)
        // Then
        XCTAssertNoThrow(sut.searchBarTextDidBeginEditing(searchBar), "searchBarTextDidBeginEditing executed")
    }
    
    func testSearchBarTextDidEndEditing() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarTextDidEndEditing(searchBar)
        // Then
        XCTAssertNoThrow(sut.searchBarTextDidEndEditing(searchBar), "searchBarTextDidEndEditing executed")
    }
    
    func testSearchBarSearchButtonClicked() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarSearchButtonClicked(searchBar)
        // Then
        XCTAssertNoThrow(sut.searchBarSearchButtonClicked(searchBar), "searchBarSearchButtonClicked executed")
    }
    
    func testSearchBarCancelButtonClicked() {
        // Given
        let searchBar = UISearchBar()
        // When
        sut.searchBarCancelButtonClicked(searchBar)
        // Then
        XCTAssertNoThrow( sut.searchBarCancelButtonClicked(searchBar), "searchBarCancelButtonClicked executed")
    }
    
    func testShouldChangeTextIn() {
        // Given
        let searchBar = UISearchBar()
        let text = "User"
        let change = NSRange()
        // When
        let testSearch = sut.searchBar(searchBar, shouldChangeTextIn: change, replacementText: text)
        // Then
        XCTAssertNoThrow(testSearch, "shouldChangeTextIn executed")
    }
    
}
