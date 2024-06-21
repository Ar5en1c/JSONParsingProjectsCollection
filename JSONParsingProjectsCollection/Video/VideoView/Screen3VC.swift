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
    
    var viewModel = Screen3DataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        loadData()
    }
}

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


extension Screen3VC: VideosInfoDataDelegate {
    func didFetchVideosInfo() {
        guard let videosInfo = viewModel.getVideoInfo(at: 0) else { return }

        videoTitle.text = "Video Title: \(videosInfo.title)"
        if let formattedDate = videosInfo.created_at.formattedDate(inputFormat: "yyyy-MM-dd'T'HH:mm:ssZZZZZ") {
            createdAt.text = "Created At: \(formattedDate)"
        } else {
            createdAt.text = "Created At: \(videosInfo.created_at)"
        }
            
        // Display details from the first transcoding
        if let firstTranscoding = videosInfo.transcodings.first {
            idLabel.text = "Id: \(firstTranscoding.id)"
            titleTranscoding.text = "Title: \(firstTranscoding.title)"
            heightLabel.text = "Height: \(firstTranscoding.height)"
        } else {
            // Handle case where there are no transcodings
            idLabel.text = "Id: N/A"
            titleTranscoding.text = "Title: N/A"
            heightLabel.text = "Height: N/A"
        }
    }
}
