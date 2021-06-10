//
//  ViewController.swift
//  NewBottomSheet
//
//  Created by Takuya Aso on 2021/06/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        animalLabel.text = "❓"
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        
    }
}
