//
//  JSONParsingProjectsCollectionTests.swift
//  JSONParsingProjectsCollectionTests
//
//  Created by Kuldeep Singh on 6/18/24.
//

import XCTest
@testable import JSONParsingProjectsCollection

final class Screen1DataViewModelTests: XCTestCase {
    
    var mockApiManager: APIManager!
    var mockViewController: Screen1VC!
    var mockDataViewModel: Screen1DataViewModel!
    var mockNetworkManager: NetworkManager!

    override func setUpWithError() throws {
        mockApiManager = APIManager()
        mockViewController = Screen1VC()
        mockDataViewModel = Screen1DataViewModel(apiManager: mockApiManager)
        mockViewController.viewModel = mockDataViewModel
        mockNetworkManager = NetworkManager.shared
    }

    override func tearDownWithError() throws {
        mockApiManager = nil
        mockViewController = nil
        mockDataViewModel = nil
    }

    func testFetchUsersSuccess() async {
        mockNetworkManager.isOnline.toggle()
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
