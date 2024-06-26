//
//  Screen2DataViewModelTests.swift
//  JSONParsingProjectsCollectionTests
//
//  Created by Kuldeep Singh on 6/24/24.
//

import XCTest
@testable import JSONParsingProjectsCollection

final class Screen2DataViewModelTests: XCTestCase {
    
    var mockApiManager: MockAPIManager!
    var mockViewController: Screen2VC!
    var mockDataViewModel: Screen2DataViewModel!

    override func setUpWithError() throws {
        mockApiManager = MockAPIManager()
        mockViewController = Screen2VC()
        mockDataViewModel = Screen2DataViewModel(apiManager: mockApiManager)
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
            print("Error during mock fetch in Screen1 Data view model")
            XCTFail("Fetch data should not throw an error")
        }
        
        let actorInfo = mockDataViewModel.getActorInfo()
        XCTAssertNotNil(actorInfo, "Artist info should not be nil")
        XCTAssertEqual(actorInfo?.name, "John Doe", "Artist name should match")
    }

}
