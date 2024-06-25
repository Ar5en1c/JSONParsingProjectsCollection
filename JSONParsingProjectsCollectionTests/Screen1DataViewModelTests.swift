//
//  JSONParsingProjectsCollectionTests.swift
//  JSONParsingProjectsCollectionTests
//
//  Created by Kuldeep Singh on 6/18/24.
//

import XCTest
@testable import JSONParsingProjectsCollection

final class Screen1DataViewModelTests: XCTestCase {
    
    var mockApiManager: MockAPIManager!
    var mockViewController: Screen1VC!
    var mockDataViewModel: Screen1DataViewModel!

    override func setUpWithError() throws {
        mockApiManager = MockAPIManager()
        mockViewController = Screen1VC()
        mockDataViewModel = Screen1DataViewModel(apiManager: mockApiManager)
        mockViewController.viewModel = mockDataViewModel
    }

    override func tearDownWithError() throws {
        mockApiManager = nil
        mockViewController = nil
        mockDataViewModel = nil
    }

    func testFetchUsersSuccess() async {
        do {
            try await mockDataViewModel.fetchData()
        } catch {
            print("Error durnig mock fetch in Screen1 Data view model")
        }

        XCTAssertEqual(mockDataViewModel.getTotalUsersCount(), 2, "Expected 2 users")
        let userInfo = mockDataViewModel.getUserInfo(at: 0)
        XCTAssertNotNil(userInfo, "Artist info should not be nil")
        XCTAssertEqual(userInfo?.name, "John Doe", "Artist name should match")
    }

}
