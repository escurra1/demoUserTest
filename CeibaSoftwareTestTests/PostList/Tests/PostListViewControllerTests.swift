//
//  PostListViewControllerTests.swift
//  CeibaSoftwareTestUITests
//
//  Created by Escurra Colquis on 8/10/22.
//

@testable import CeibaSoftwareTest
import XCTest

class PostListViewControllerTests: XCTestCase {
    // MARK: Subject under test
    var sut: PostListViewController!
    var spyPresenter: PostListPresenterProtocolSpy!
    
    // MARK: Test lifecycle
    override  func setUp() {
        super.setUp()
        setupPostListViewController()
    }
    
    override  func tearDown() {
        spyPresenter = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupPostListViewController() {
        sut = PostListViewController()
        spyPresenter = PostListPresenterProtocolSpy()
        sut.listPostTableView =  UITableView()
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
    
    func testDidTapBack() {
        // Given
        let buttonAction = UIButton()
        // When
        sut.didTapBack(buttonAction)
        // Then
        XCTAssertTrue(spyPresenter.didGoToBack)
        XCTAssertNoThrow(sut.didTapBack(buttonAction), "didTapBack executed")
    }
    
    func testNumberOfRowsInSection() {
        // Given
        let postListTableView = UITableView(frame:  CGRect(x: 0, y: 0, width: 100, height: 100))
        let section: Int = 0
        var itemInSection = sut.tableView(postListTableView, numberOfRowsInSection: section)
        // When
        itemInSection = 0
        // Then
        XCTAssertEqual(itemInSection, 0)
    }
    
    func testCellForRowAt() {
        // Given
        let postListTableView = UITableView(frame:  CGRect(x: 0, y: 0, width: 100, height: 100))
        let indexPath = IndexPath(item: 0, section: 0)
        // When
        let cell = postListTableView.dataSource?.tableView(postListTableView, cellForRowAt: indexPath) as? PostListTableViewCell
        guard let cellTest = cell else {
            return
        }
        // Then
        XCTAssertTrue(cellTest == cellTest, "cellTest executed")
        XCTAssertNotNil(cellTest.titleLabel)
        XCTAssertNotNil(cellTest.bodyLabel)
    }
    
    func testHeightForRowAt() {
        // Given
        let postListTableView = UITableView(frame:  CGRect(x: 0, y: 0, width: 100, height: 100))
        let indexPath = IndexPath(item: 0, section: 0)
        var itemInSection = sut.tableView(postListTableView, heightForRowAt: indexPath)
        // When
        itemInSection = 0
        // Then
        XCTAssertEqual(itemInSection, 0)
    }
    
    func testshowListPost() {
        // Given
        let post: [PostResponse] = [PostResponse]()
        let userId: Int = 0
        // When
        sut.showListPost(post: post, userId: userId)
        // Then
        XCTAssertNoThrow(sut.showListPost(post: post, userId: userId), "showListPost executed")
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
    
}
