//
//  DetailedNewsVC.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import UIKit
import WebKit

class DetailedNewsVC: UIViewController {
    
    var newsData: Article?
    var webView: WKWebView!

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsTimeLabel: UILabel!
    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    
    @IBOutlet weak var newsWebSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupSegmentControl()
        loadNews()
    }
    
    func setupWebView() {
        webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: newsWebSegmentControl.bottomAnchor, constant: 8),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        webView.isHidden = true
    }
    
    func setupSegmentControl() {
        newsWebSegmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            // Show web view
            if let urlString = newsData?.url, let url = URL(string: urlString) {
                webView.load(URLRequest(url: url))
            }
            webView.isHidden = false
        } else {
            // Hide web view
            webView.isHidden = true
        }
    }

}

extension DetailedNewsVC {
    func loadNews() {
        guard let newsArticle = newsData else { return }
        newsTitleLabel.text = newsArticle.title
        newsAuthorLabel.text = newsArticle.author
        if let imageURL = newsArticle.urlToImage {
            Task {
                do {
                    try await newsImageView.getImageFromServer(imageURL: imageURL) }
                catch {
                    print(ErrorMessages.errorImgFetchMessage.rawValue)
                }
            }
        }
        newsSourceLabel.text = newsArticle.source.name
        newsDescriptionLabel.text = newsArticle.description
        if let formattedDate = newsArticle.publishedAt.formattedDate() {
            newsTimeLabel.text = formattedDate
        }
    }
}
