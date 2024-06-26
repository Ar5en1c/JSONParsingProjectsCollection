//
//  ViewController.swift
//  JSONParsingProjectsCollection
//name
//height
//birth_year
//gender
//created
//  Created by Kuldeep Singh on 6/18/24.
//

import UIKit

class JSONProjectMainVC: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var internetSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        internetSwitch.addTarget(self, action: #selector(internetSwitchToggled(_:)), for: .valueChanged)
    }
    
    @objc func internetSwitchToggled(_ sender: UISwitch) {
        NetworkManager.shared.isOnline = sender.isOn
        self.mainView.backgroundColor = NetworkManager.shared.isOnline ? .systemYellow : .systemGray4
        print("Network status changed to \(NetworkManager.shared.isOnline ? "Online" : "Offline")")
        }

//    MARK: Handling the User info Button click
    @IBAction func screen1Tapped(_ sender: Any) {
        guard  let screen1VC = storyboard?.instantiateViewController(identifier: "Screen1VC") as? Screen1VC else {
            return
        }
        navigationController?.pushViewController(screen1VC, animated: true)
    }

//    MARK: Handling the Actor info Button click
    @IBAction func screen2Tapped(_ sender: Any) {
        guard  let screen2VC = storyboard?.instantiateViewController(identifier: "Screen2VC") as? Screen2VC else {
            return
        }
        navigationController?.pushViewController(screen2VC, animated: true)
    }

//    MARK: Handling the Video info Button click
    @IBAction func screen3Tapped(_ sender: Any) {
        guard  let screen3VC = storyboard?.instantiateViewController(identifier: "Screen3VC") as? Screen3VC else {
            return
        }
        navigationController?.pushViewController(screen3VC, animated: true)
    }

//    MARK: Handling the NewsFeed info Button click
    @IBAction func screen4Tapped(_ sender: Any) {
        guard  let screen4VC = storyboard?.instantiateViewController(identifier: "Screen4VC") as? Screen4VC else {
            return
        }
        navigationController?.pushViewController(screen4VC, animated: true)
    }

//    MARK: Handling the Meal info Button click
    @IBAction func screen5Tapped(_ sender: Any) {
        guard  let screen5VC = storyboard?.instantiateViewController(identifier: "MealsViewController") as? MealsViewController else {
            return
        }
        navigationController?.pushViewController(screen5VC, animated: true)
    }
}

