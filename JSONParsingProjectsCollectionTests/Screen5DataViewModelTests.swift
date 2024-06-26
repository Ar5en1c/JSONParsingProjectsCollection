//
//  Screen3DataViewModelTests.swift
//  JSONParsingProjectsCollectionTests
//
//  Created by Kuldeep Singh on 6/24/24.
//

import XCTest
@testable import JSONParsingProjectsCollection

final class Screen5DataViewModelTests: XCTestCase {
    
    var mockApiManager: MockAPIManager!
    var mockViewController: MealsViewController!
    var mockDataViewModel: Screen5DataViewModel!

    override func setUpWithError() throws {
        mockApiManager = MockAPIManager()
        mockViewController = MealsViewController()
        mockDataViewModel = Screen5DataViewModel(apiManager: mockApiManager)
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
        
        let mealsCount = mockDataViewModel.getNumberOfMeals()
        XCTAssertEqual(mealsCount, 1)
        let mealInfoAt0 = mockDataViewModel.getMealsInfo(at: 0)
        XCTAssertEqual(mealInfoAt0?.strMeal, "Spaghetti Carbonara", "Meal name should match")
    }

}
