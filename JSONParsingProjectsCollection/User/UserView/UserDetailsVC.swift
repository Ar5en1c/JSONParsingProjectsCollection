//
//  UserDetailsVC.swift
//  JSONParsingProjectsCollection
//
//  Created by Kuldeep Singh on 6/18/24.
//

import UIKit

class UserDetailsVC: UIViewController {
    
    var dataReceived: User?

    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
}


extension UserDetailsVC {
    func loadData() {
        guard let user = dataReceived else { return }
        userIDLabel.text = "ID: \(user.id)"
        userNameLabel.text = "Username: \(user.username)"
        nameLabel.text = "Name: \(user.name)"
        emailLabel.text = "Email: \(user.email)"
        phoneLabel.text = "Phone: \(user.phone)"
        websiteLabel.text = "Website: \(user.website)"
        
        let address = "\(user.address.street), \(user.address.city)"
        addressLabel.text = "Address: \(address)"
        
        let company = "\(user.company.name)"
        companyLabel.text = "Company: \(company)"
        
    }
}
