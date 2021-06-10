//
//  AnimalViewController.swift
//  NewBottomSheet
//
//  Created by Takuya Aso on 2021/06/10.
//

import UIKit

protocol AnimalListDelegate: AnyObject {
    func animalDidTap(animal: String)
}

class AnimalViewController: UIViewController {
    
    private let animalList = ["🐹", "🐱", "🦄", "🐼", "🐶", "🐯", "👽", "🐬", "🐟", "🦊", "🐸", "🦜", "🐻", "🐲", "🦉", "🐗", "🐮", "🐵"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var delegate: AnimalListDelegate?

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
        delegate?.animalDidTap(animal: animalList[indexPath.row])
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

extension AnimalViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.main.bounds.width - 16.0) / 3
        return CGSize(width: width, height: width)
    }
}
