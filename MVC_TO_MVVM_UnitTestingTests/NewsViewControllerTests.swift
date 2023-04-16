//
//  NewsViewControllerTests.swift
//  MVC_TO_MVVM_UnitTestingTests
//
//  Created by Ganesh on 16/04/23.
//

import XCTest
@testable import MVC_TO_MVVM_UnitTesting

class NewsViewControllerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_canInit() throws {
        
        _ = try makeSUT()
    }
    
    func test_viewDidLoad_setsTitle() throws {
        let sut = try makeSUT()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.title, "News")
    }
    
    func test_viewDidLoad_configureTableView() throws {
        let sut = try makeSUT()
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView.dataSource, "data source")
    }
    
    private func makeSUT() throws -> NewsViewController {
        let bundle = Bundle(for: NewsViewController.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)
        
        let initialVC = sb.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        return try XCTUnwrap(navigation.topViewController as? NewsViewController)
    }
}
