//
//  FoodTableViewCell.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var typeFoodLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    //MARK: - Functions
    func setupCell(foodName: String, typeFood: String, imageFood: UIImage) {
        foodNameLabel.text  = foodName
        typeFoodLabel.text  = typeFood
        foodImageView.image = imageFood
    }
}
