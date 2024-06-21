//
//  Screen4VC.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import UIKit

class Screen4VC: UIViewController {

    @IBOutlet weak var newsFeedTable: UITableView!
    var viewModel = Screen4DataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTable.dataSource = self
        newsFeedTable.delegate = self
        viewModel.delegate = self
        loadData()
    }
}

extension Screen4VC {
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

extension Screen4VC: NewsInfoDataDelegate {
    func didFetchNewsInfo() {
        DispatchQueue.main.async {
            self.newsFeedTable.reloadData()
        }
    }
}

extension Screen4VC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsFeedTable.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as? NewsFeedCell else {return UITableViewCell()}
        cell.dataReceived = viewModel.getNewsArticleInfo(at: indexPath.row)
        return cell
    }
}

extension Screen4VC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let DetailedVC = storyboard?.instantiateViewController(withIdentifier: "DetailedNewsVC") as? DetailedNewsVC else { return }
        DetailedVC.newsData = viewModel.getNewsArticleInfo(at: indexPath.row)
        navigationController?.pushViewController(DetailedVC, animated: true)
    }
}
