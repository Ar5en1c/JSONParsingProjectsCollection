//
//  Screen2VC.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import UIKit

class Screen2VC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!

    var viewModel = Screen2DataViewModel(apiManager: APIManager())

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        loadData()
    }
}

extension Screen2VC {
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


extension Screen2VC: ActorInfoDataDelegate {
    func didFetchActorInfo() {
        guard let actorInfo = viewModel.getActorInfo() else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = "Name: \(actorInfo.name)"
            self.heightLabel.text = "Height: \(actorInfo.height)"
            self.birthYearLabel.text = "Birth Year: \(actorInfo.birth_year)"
            self.genderLabel.text = "Gender: \(actorInfo.gender)"
            if let formattedDate = actorInfo.created.formattedDate() {
                self.createdLabel.text = "Created: \(formattedDate)"
            } else {
                self.createdLabel.text = "Created: \(actorInfo.created)"
            }
        }
    }
}
