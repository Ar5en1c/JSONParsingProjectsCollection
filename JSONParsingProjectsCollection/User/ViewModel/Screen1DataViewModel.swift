//
//  Screen1DataViewModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation

class Screen1DataViewModel {
    weak var delegate: UserDataDelegate?
    private var userInfoList: [User] = []
    private var apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func fetchData() async throws {
        do {
            let userResult: [User] = try await apiManager.fetchData(url: Constants.userInfoAPI.rawValue)
            self.userInfoList = userResult
            self.delegate?.didFetchUserData()
        } catch {
            print(ErrorMessages.errorFetchMessage.rawValue, error)
        }
    }
    
    func getTotalUsersCount() -> Int {
        return userInfoList.count
    }
    
    func getUserInfo(at index: Int) -> User? {
        guard index >= 0 && index < userInfoList.count else {
            return nil
        }
        return userInfoList[index]
    }
}




//class Screen1DataViewModel {
//    weak var delegate: UserDataDelegate?
//    private var userInfoList: [User] = []
//    
//    func fetchData(){
//        APIManager.shared.fetchData(url: Constants.userInfoAPI.rawValue) { (userResult: [User]?) in
//            guard let userResult = userResult else {
//                print(ErrorMessages.noDataMessage.rawValue)
//                return
//            }
//            self.userInfoList = userResult
//            self.delegate?.didFetchUserData()
//        }
//    }
//    
//    func getTotalUsersCount() -> Int {
//        return userInfoList.count
//    }
//    
//    func getUserInfo(at index: Int) -> User? {
//        guard index >= 0 && index < userInfoList.count else {
//            return nil
//        }
//        return userInfoList[index]
//    }
//}
