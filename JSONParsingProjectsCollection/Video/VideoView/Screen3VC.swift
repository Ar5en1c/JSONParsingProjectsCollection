//
//  Screen3VC.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import UIKit

class Screen3VC: UIViewController {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleTranscoding: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var viewModel = Screen3DataViewModel(apiManager: APIManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        loadData()
    }
}

// MARK: Fetching the data by calling the fetchData in Screen3DataViewModel
extension Screen3VC {
    func loadData() {
        Task {
            do {
                try await viewModel.fetchData()
            } catch {
                print("Error fetching data:", error)
            }
        }
    }
}

// MARK: Assigning the data to the labels
extension Screen3VC: VideosInfoDataDelegate {
    func didFetchVideosInfo() {
        guard let videosInfo = viewModel.getVideoInfo(at: 0) else { return }
        DispatchQueue.main.async { [self] in
            self.videoTitle.text = "Video Title: \(videosInfo.title)"
            if let formattedDate = videosInfo.created_at.formattedDate(inputFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZZ") {
                self.createdAt.text = "Created At: \(formattedDate)"
            } else {
                self.createdAt.text = "Created At: \(videosInfo.created_at)"
            }
            
            // Display details from the first transcoding
            if let firstTranscoding = videosInfo.transcodings.first {
                self.idLabel.text = "Id: \(firstTranscoding.id)"
                self.titleTranscoding.text = "Title: \(firstTranscoding.title)"
                self.heightLabel.text = "Height: \(firstTranscoding.height)"
            } else {
                // Handle case where there are no transcodings
                self.idLabel.text = "Id: N/A"
                self.titleTranscoding.text = "Title: N/A"
                self.heightLabel.text = "Height: N/A"
            }
        }
    }
}
