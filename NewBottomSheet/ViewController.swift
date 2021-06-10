//
//  ViewController.swift
//  NewBottomSheet
//
//  Created by Takuya Aso on 2021/06/10.
//

import UIKit
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var animalLabel: UILabel!
    var animalList: AnimalViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        animalLabel.text = "❓"
        let sb = UIStoryboard(name: "AnimalList", bundle: nil)
        animalList = sb.instantiateInitialViewController()!
        animalList.delegate = self
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        
        animalList.modalPresentationStyle = .popover
        if let sheet = animalList.popoverPresentationController?.adaptiveSheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        present(animalList, animated: true)
    }
}

extension ViewController: AnimalListDelegate {
    func animalDidTap(animal: String) {
        animalLabel.text = animal
        if let sheet = animalList.popoverPresentationController?.adaptiveSheetPresentationController {
            sheet.animateChanges {
                sheet.selectedDetentIdentifier = .medium
            }
        }
    }
}
