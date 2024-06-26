//
//  MealsViewController.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import UIKit

class MealsViewController: UIViewController {
    
    @IBOutlet weak var mealsTableView: UITableView!
    var viewModel = Screen5DataViewModel(apiManager: APIManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealsTableView.dataSource = self
        viewModel.delegate = self
        loadData()
    }
}

extension MealsViewController {
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

extension MealsViewController: MealsInfoDataDelegate {
    func didFetchMealsInfo() {
        DispatchQueue.main.async {
            self.mealsTableView.reloadData()
        }
    }
}


extension MealsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfMeals()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mealsTableView.dequeueReusableCell(withIdentifier: "MealsInfoCell", for: indexPath) as? MealsInfoCell else { return UITableViewCell()}
        cell.dataReceived = viewModel.getMealsInfo(at: indexPath.row)
        cell.loadData()
        return cell
    }
}
