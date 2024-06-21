//
//  Screen3DataViewModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import Foundation

//class Screen3DataViewModel {
//    weak var delegate: VideosInfoDataDelegate?
//    private var videoInfoList: [VideosModel] = []
//    
//    func fetchData(){
//        APIManager.shared.fetchData(url: Constants.videoInfoAPI.rawValue) { (videosInfo: [VideosModel]?) in
//            guard let videosInfo = videosInfo else {
//                print(ErrorMessages.noDataMessage.rawValue)
//                return
//            }
//            
//            self.videoInfoList = videosInfo
//            DispatchQueue.main.async {
//                self.delegate?.didFetchVideosInfo()
//            }
//        }
//    }
//    
//    func getVideoInfo(at index: Int) -> VideosModel? {
//        guard index < videoInfoList.count else {
//            return nil
//        }
//        return videoInfoList[index]
//    }
//    
//    func numberOfVideos() -> Int {
//        return videoInfoList.count
//    }
//}

class Screen3DataViewModel {
    weak var delegate: VideosInfoDataDelegate?
    private var videoInfoList: [VideosModel] = []

    func fetchData() async throws{
        do {
            let videosData: [VideosModel]? = try await APIManager.shared.fetchData(url: Constants.videoInfoAPI.rawValue)
            DispatchQueue.main.async {
                self.videoInfoList = videosData ?? []
                self.delegate?.didFetchVideosInfo()
            }
        } catch {
            print(ErrorMessages.errorFetchMessage.rawValue)
        }
    }

    func getVideoInfo(at index: Int) -> VideosModel? {
        guard index >= 0 && index < videoInfoList.count  else {
            return nil
        }
        return videoInfoList[index]
    }

    func numberOfVideos() -> Int {
        return videoInfoList.count
    }
}
