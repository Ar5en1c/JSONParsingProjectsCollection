//
//  Screen4DataViewModel.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import Foundation

class Screen4DataViewModel {
    weak var delegate: NewsInfoDataDelegate?
    private var newsArticleInfoList: [Article]?

    func fetchData() async throws{
        do {
            let newsInfo: NewsResponse? = try await APIManager.shared.fetchData(url: Constants.newsInfoAPI.rawValue)
            DispatchQueue.main.async {
                self.newsArticleInfoList = newsInfo?.articles
                self.delegate?.didFetchNewsInfo()
            }
        } catch {
            print(ErrorMessages.errorFetchMessage.rawValue)
        }
    }

    func getNewsArticleInfo(at index: Int) -> Article? {
        guard index < newsArticleInfoList?.count ?? 0 else {
            return nil
        }
        return newsArticleInfoList?[index]
    }

    func getNumberOfArticles() -> Int {
        return newsArticleInfoList?.count ?? 0
    }
}

//class Screen4DataViewModel {
//    weak var delegate: NewsInfoDataDelegate?
//    private var newsArticleInfoList: [Article]?
//    
//    func fetchData(){
//        APIManager.shared.fetchData(url: Constants.newsInfoAPI.rawValue) { (newsInfo: NewsResponse?) in
//            guard let newsInfo = newsInfo else {
//                print(ErrorMessages.noDataMessage.rawValue)
//                return
//            }
//            
//            self.newsArticleInfoList = newsInfo.articles
//            DispatchQueue.main.async {
//                self.delegate?.didFetchNewsInfo()
//            }
//        }
//    }
//    
//    func getNewsArticleInfo(at index: Int) -> Article? {
//        guard index < newsArticleInfoList?.count ?? 0 else {
//            return nil
//        }
//        return newsArticleInfoList?[index]
//    }
//    
//    func getNumberOfArticles() -> Int {
//        return newsArticleInfoList?.count ?? 0
//    }
//}
