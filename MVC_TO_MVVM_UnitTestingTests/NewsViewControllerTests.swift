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
        let bundle = Bundle(for: NewsViewController.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)
        
        let initialVC = sb.instantiateInitialViewController()
        let navigation = try XCTUnwrap(initialVC as? UINavigationController)
        
        let sut = try XCTUnwrap(navigation.topViewController as? NewsViewController)
    }

    

}
