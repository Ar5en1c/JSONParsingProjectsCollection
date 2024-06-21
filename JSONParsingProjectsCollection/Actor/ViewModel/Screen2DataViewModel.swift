//
//  Screen2DataViewModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation

//class Screen2DataViewModel {
//    weak var delegate: ActorInfoDataDelegate?
//    private var actorInfo: ActorInfo?
//    
//    func fetchData(){
//        APIManager.shared.fetchData(url: Constants.actorInfoAPI.rawValue) { (actorInfo: ActorInfo?) in
//            guard let actorInfo = actorInfo else {
//                print(ErrorMessages.noDataMessage.rawValue)
//                return
//            }
//            
//            self.actorInfo = actorInfo
//            DispatchQueue.main.async {
//                self.delegate?.didFetchActorInfo()
//            }
//        }
//    }
//    
//    func getActorInfo() -> ActorInfo? {
//        return actorInfo
//    }
//}


class Screen2DataViewModel {
    weak var delegate: ActorInfoDataDelegate?
    private var actorInfo: ActorInfo?
    
    func fetchData() async throws{
        do {
            let actorData: ActorInfo? = try await APIManager.shared.fetchData(url: Constants.actorInfoAPI.rawValue)
            DispatchQueue.main.async {
                self.actorInfo = actorData
                self.delegate?.didFetchActorInfo()
            }
        } catch {
            print(ErrorMessages.errorFetchMessage.rawValue)
        }
    }
    
    func getActorInfo() -> ActorInfo? {
        return actorInfo
    }
}
