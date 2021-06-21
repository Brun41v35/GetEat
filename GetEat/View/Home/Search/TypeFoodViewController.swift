//
//  TypeFoodViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 20/06/21.
//

import UIKit

class TypeFoodViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Variables
    let cellIdentifier = "TypeFoodCollectionViewCell"
    let imagesFood = [UIImage(named: "teste"), UIImage(named: "teste"), UIImage(named: "teste")]
    let nameFood = ["Teste", "Teste", "Teste"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupCell()
    }
    
    private func setupCell() {
        let nibCell = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - Actions
    
}

//MARK: - Extension
extension TypeFoodViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesFood.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 172, height: 247)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! TypeFoodCollectionViewCell
        cell.setupFood(nameImage: imagesFood[indexPath.row]!, nameFood: nameFood[indexPath.row])
        return cell
    }
}
