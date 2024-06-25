//
//  Screen5DataViewModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import Foundation

class Screen5DataViewModel {
    weak var delegate: MealsInfoDataDelegate?
    private var mealsInfoList: [Meal]?
    private var apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }

    func fetchData() async throws {
        do {
            let mealsInfo: Menu? = try await apiManager.fetchData(url: Constants.mealsInfoAPI.rawValue)
//            DispatchQueue.main.async {
                self.mealsInfoList = mealsInfo?.meals
                self.delegate?.didFetchMealsInfo()
//            }
        } catch {
            
        }
    }

    func getMealsInfo(at index: Int) -> Meal? {
        guard index < mealsInfoList?.count ?? 0 else {
            return nil
        }
        return mealsInfoList?[index]
    }

    func getNumberOfMeals() -> Int {
        return mealsInfoList?.count ?? 0
    }
}

//class Screen5DataViewModel {
//    weak var delegate: MealsInfoDataDelegate?
//    private var mealsInfoList: [Meal]?
//    
//    func fetchData(){
//        APIManager.shared.fetchData(url: Constants.mealsInfoAPI.rawValue) { (mealsInfo: Menu?) in
//            guard let mealsInfo = mealsInfo else {
//                print(ErrorMessages.noDataMessage.rawValue)
//                return
//            }
//            
//            self.mealsInfoList = mealsInfo.meals
//            DispatchQueue.main.async {
//                self.delegate?.didFetchMealsInfo()
//            }
//        }
//    }
//    
//    func getMealsInfo(at index: Int) -> Meal? {
//        guard index < mealsInfoList?.count ?? 0 else {
//            return nil
//        }
//        return mealsInfoList?[index]
//    }
//    
//    func getNumberOfMeals() -> Int {
//        return mealsInfoList?.count ?? 0
//    }
//}

