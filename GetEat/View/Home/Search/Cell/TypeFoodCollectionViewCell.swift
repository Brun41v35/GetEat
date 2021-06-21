//
//  TypeFoodCollectionViewCell.swift
//  GetEat
//
//  Created by Bruno Silva on 20/06/21.
//

import UIKit

class TypeFoodCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imageFood: UIImageView!
    @IBOutlet weak var nameFood: UILabel!
    
    //MARK: - Functions
    func setupFood(nameImage: UIImage, nameFood: String) {
        self.imageFood.image = nameImage
        self.nameFood.text = nameFood
    }
}
