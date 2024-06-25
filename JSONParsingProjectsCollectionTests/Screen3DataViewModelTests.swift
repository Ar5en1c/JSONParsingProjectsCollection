//
//  Screen3DataViewModelTests.swift
//  JSONParsingProjectsCollectionTests
//
//  Created by Kuldeep Singh on 6/24/24.
//

import XCTest
@testable import JSONParsingProjectsCollection

final class Screen3DataViewModelTests: XCTestCase {
    
    var mockApiManager: MockAPIManager!
    var mockViewController: Screen3VC!
    var mockDataViewModel: Screen3DataViewModel!

    override func setUpWithError() throws {
        mockApiManager = MockAPIManager()
        mockViewController = Screen3VC()
        mockDataViewModel = Screen3DataViewModel(apiManager: mockApiManager)
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
        
        let vidsCount = mockDataViewModel.numberOfVideos()
        XCTAssertEqual(vidsCount, 1)
        let vidsInfoAt0 = mockDataViewModel.getVideoInfo(at: 0)
        XCTAssertEqual(vidsInfoAt0?.title, "Sample Video", "Video name should match")
    }

}
