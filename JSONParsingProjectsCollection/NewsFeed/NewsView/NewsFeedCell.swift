//
//  NewsFeedCell.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import UIKit

class NewsFeedCell: UITableViewCell {
    
    var dataReceived: Article? {
            didSet {
                loadData()
            }
        }
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: Loading the news article detials in the cell
extension NewsFeedCell {
    func loadData() {
        guard let article = dataReceived else { return }
        headlineLabel.text = article.title
        if (article.author != nil) {
            authorLabel.text = article.author } else {
                authorLabel.text = Constants.unknownAuthor.rawValue
            }
        sourceLabel.text = article.source.name
        if let imageURL = article.urlToImage {
            Task {
                do {
                    try await newsImage.getImageFromServer(imageURL: imageURL) }
                catch {
                    print(ErrorMessages.errorImgFetchMessage.rawValue)
                }
            }
        }
    }
}   
