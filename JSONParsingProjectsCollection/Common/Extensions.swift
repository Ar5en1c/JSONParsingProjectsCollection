//
//  Extensions.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import Foundation
import UIKit


// MARK: extension for formating the date to look prettier
extension String {
    func formattedDate(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ", outputFormat: String = "MMM d, yyyy") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        guard let date = dateFormatter.date(from: self) else { return nil }
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date)
    }
}

// MARK: extension for fetfching and assigning the UIImage with data
extension UIImageView {
    func getImageFromServer(imageURL: String) async throws {
            if let data = try await APIManager.shared.fetchDataAsDataObj(from: imageURL) {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        self.image = image
                    } else {
                        self.image = UIImage(systemName: ErrorMessages.errorImg.rawValue)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.image = UIImage(systemName: ErrorMessages.errorImg.rawValue)
                }
            }
        }
}
