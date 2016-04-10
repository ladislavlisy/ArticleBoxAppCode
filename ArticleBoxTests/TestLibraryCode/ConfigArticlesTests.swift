//
// Created by Ladislav Lisy on 10.04.16.
// Copyright (c) 2016 ___FULLUSERNAME___. All rights reserved.
//

import XCTest
@testable import ArticleBox

class ConfigArticlesTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShould_Return_53_For_Articles_Length() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let articlesAll: Array<Article> = ProcessConfigArticles.ConfigureArticles();
        XCTAssertEqual(53, articlesAll.count);
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}