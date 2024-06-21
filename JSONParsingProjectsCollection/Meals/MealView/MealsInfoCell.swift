//
//  MealsInfoCell.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/19/24.
//

import UIKit

class MealsInfoCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mealsTitleLabel: UILabel!
    @IBOutlet weak var mealsImageView: UIImageView!
    @IBOutlet weak var showMoreButton: UIButton!
    
    var dataReceived: Meal?
    var isExpanded: Bool = false {
        didSet {
            descriptionLabel.numberOfLines = isExpanded ? 0 : 4
            showMoreButton.setTitle(isExpanded ? "Show Less" : "Show More", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShowMoreButton()
        loadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupShowMoreButton() {
        showMoreButton.setTitle("Show More", for: .normal)
        showMoreButton.addTarget(self, action: #selector(toggleDescription), for: .touchUpInside)
    }
    
    @objc func toggleDescription() {
        isExpanded.toggle()
        if let tableView = self.superview as? UITableView {
            UIView.setAnimationsEnabled(false)
            tableView.beginUpdates()
            tableView.endUpdates()
            UIView.setAnimationsEnabled(true)
        }
    }
}

extension MealsInfoCell {
    func loadData() {
        guard let meal = dataReceived else { return }
        mealsTitleLabel.text = meal.strMeal
        descriptionLabel.text = meal.strInstructions
        descriptionLabel.numberOfLines = isExpanded ? 0 : 4
        Task {
            do {
                try await mealsImageView.getImageFromServer(imageURL: meal.strMealThumb)}
            catch {
                print(ErrorMessages.errorImgFetchMessage.rawValue)
            }
        }
    }
}
