//
//  AnimalViewController.swift
//  NewBottomSheet
//
//  Created by Takuya Aso on 2021/06/10.
//

import UIKit

class AnimalViewController: UIViewController {
    
    private let animalList = ["🐹", "🐱", "🦄", "🐼", "🐶", "🐯", "👽", "🐬", "🐟", "🦊"]

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let cellNib = UINib(nibName: "AnimalCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "animalCell")
    }
}

extension AnimalViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension AnimalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animalCell", for: indexPath) as? AnimalCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.animalLabel.text = animalList[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalList.count
    }
}
