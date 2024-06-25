//
//  Screen3DataViewModelTests.swift
//  JSONParsingProjectsCollectionTests
//
//  Created by Kuldeep Singh on 6/24/24.
//

import XCTest
@testable import JSONParsingProjectsCollection

final class Screen4DataViewModelTests: XCTestCase {
    
    var mockApiManager: MockAPIManager!
    var mockViewController: Screen4VC!
    var mockDataViewModel: Screen4DataViewModel!

    override func setUpWithError() throws {
        mockApiManager = MockAPIManager()
        mockViewController = Screen4VC()
        mockDataViewModel = Screen4DataViewModel(apiManager: mockApiManager)
        mockViewController.viewModel = mockDataViewModel
    }

    override func tearDownWithError() throws {
        mockApiManager = nil
        mockViewController = nil
        mockDataViewModel = nil
    }

    func testFetchActorSuccess() async throws {
        do {
            try await mockDataViewModel.fetchData()
        } catch {
            print("Error during mock fetch in Screen3 Data view model")
            XCTFail("Fetch data should not throw an error")
        }
        
        let newsCount = mockDataViewModel.getNumberOfArticles()
        XCTAssertEqual(newsCount, 1)
        let newsInfoAt0 = mockDataViewModel.getNewsArticleInfo(at: 0)
        XCTAssertEqual(newsInfoAt0?.title, "Breaking News: Something Happened!", "News title should match")
    }

}
