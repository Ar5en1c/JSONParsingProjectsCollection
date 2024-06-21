//
//  APIManager.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation

//class APIManager {
//    static let shared = APIManager()
//    
//    func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> ()) {
//        guard let serverURL = URL(string: url) else {
//            completion(nil)
//            return
//        }
//        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) { data, response, error in
//            if let error = error {
//                print("\(ErrorMessages.errorFetchMessage.rawValue): \(error)")
//                completion(nil)
//                return
//            }
//            guard let data = data else {
//                print(ErrorMessages.noDataMessage.rawValue)
//                completion(nil)
//                return
//            }
//            do {
//                let decodedData = try JSONDecoder().decode(T.self, from: data)
//                completion(decodedData)
//            } catch {
//                print("\(ErrorMessages.errorInSerializing.rawValue): \(error)")
//                completion(nil)
//            }
//        }.resume()
//    }
//    
//    // MARK: Fetch Image function with generic Data? Type for converting the data to UIImage
//    func fetchImage(from url: String, completion: @escaping (Data?) -> Void) {
//        guard let imageURL = URL(string: url) else {
//            completion(nil)
//            return
//        }
//        URLSession.shared.dataTask(with: imageURL) { data, response, error in
//            if let error = error {
//                print("\(ErrorMessages.errorFetchMessage.rawValue): \(error)")
//                completion(nil)
//                return
//            }
//            completion(data)
//        }.resume()
//    }
//    
//}

class APIManager {
    static let shared = APIManager()
    
    func fetchData<T: Decodable>(url: String) async throws -> T {
        guard let serverURL = URL(string: url) else {
            throw FetchError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: serverURL)
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw FetchError.decodingFailed(error)
        }
    }
    
    // MARK: Fetch Image function with generic Data? Type for converting the data to UIImage
    func fetchImage(from url: String) async throws -> Data? {
        guard let imageURL = URL(string: url) else {
            print(FetchError.invalidURL)
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: imageURL)
            return data
        } catch {
            print("\(ErrorMessages.errorFetchMessage.rawValue): \(error)")
            return nil
        }
    }
}
