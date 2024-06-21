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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func screen1Tapped(_ sender: Any) {
        guard  let screen1VC = storyboard?.instantiateViewController(identifier: "Screen1VC") as? Screen1VC else {
            return
        }
        navigationController?.pushViewController(screen1VC, animated: true)
    }
    
    @IBAction func screen2Tapped(_ sender: Any) {
        guard  let screen2VC = storyboard?.instantiateViewController(identifier: "Screen2VC") as? Screen2VC else {
            return
        }
        navigationController?.pushViewController(screen2VC, animated: true)
    }
    
    @IBAction func screen3Tapped(_ sender: Any) {
        guard  let screen3VC = storyboard?.instantiateViewController(identifier: "Screen3VC") as? Screen3VC else {
            return
        }
        navigationController?.pushViewController(screen3VC, animated: true)
    }
    
    @IBAction func screen4Tapped(_ sender: Any) {
        guard  let screen4VC = storyboard?.instantiateViewController(identifier: "Screen4VC") as? Screen4VC else {
            return
        }
        navigationController?.pushViewController(screen4VC, animated: true)
    }
    
    @IBAction func screen5Tapped(_ sender: Any) {
        guard  let screen5VC = storyboard?.instantiateViewController(identifier: "MealsViewController") as? MealsViewController else {
            return
        }
        navigationController?.pushViewController(screen5VC, animated: true)
    }
}

