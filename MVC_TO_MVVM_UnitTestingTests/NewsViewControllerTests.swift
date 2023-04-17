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
    
    func test_viewDidLoad_initialState() throws {
        let sut = try makeSUT()
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.numberOfArticles(), 0)
    }
    
    func test_viewDidLoad_renderArticlesFromAPI() throws{
        let sut = try makeSUT()
        sut.getArticles = { completion in
            completion(.success(
                [Article(title: "Title 1", description: "description 1"),
                 Article(title: "Title 2", description: "description 2"),
                 Article(title: "Title 3", description: "description 3"),
                ]))
        }
        
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.numberOfArticles(), 3)
        
    }
    
    private func makeSUT() throws -> NewsViewController {
        let bundle = Bundle(for: NewsViewController.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)
        
        let initialVC = sb.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        let sut = try XCTUnwrap(navigation.topViewController as? NewsViewController)
        sut.getArticles = {_ in }
        return sut
    }
}

private class NetworkServiceStub{
    
    func getArticles(completion: @escaping (Result<[Article]?, NetworkError>) -> Void) {
        
    }
}

private extension NewsViewController {
    func numberOfArticles() -> Int {
        tableView.numberOfRows(inSection: articleSections)
    }
    
    private var articleSections: Int {0}
}
