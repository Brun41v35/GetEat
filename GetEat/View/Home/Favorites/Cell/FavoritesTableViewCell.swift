//
//  FavoritesTableViewCell.swift
//  GetEat
//
//  Created by Bruno Silva on 05/06/21.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var typeFoodLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    //MARK: - Setup
    func setupCell(foodName: String, foodImage: UIImage, typeFood: String) {
        foodNameLabel.text  = foodName
        typeFoodLabel.text  = typeFood
        foodImageView.image = foodImage
    }    
}
