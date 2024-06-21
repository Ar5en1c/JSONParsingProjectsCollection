//
//  Screen1VC.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import UIKit

class Screen1VC: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    var viewModel = Screen1DataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self
        userTableView.delegate = self
        viewModel.delegate = self
        loadData()
    }
}

extension Screen1VC {
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

extension Screen1VC: UserDataDelegate {
    func didFetchUserData() {
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
}

extension Screen1VC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: "userNameCell", for: indexPath)
        cell.textLabel?.text = viewModel.getUserInfo(at: indexPath.row)?.name
        return cell
    }
}

extension Screen1VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let userDetailsVC = storyboard?.instantiateViewController(identifier: "UserDetailsVC") as? UserDetailsVC else { return }
        userDetailsVC.dataReceived = viewModel.getUserInfo(at: indexPath.row)
        navigationController?.pushViewController(userDetailsVC, animated: true)
    }
}
