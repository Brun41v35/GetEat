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
    @IBOutlet weak var cellView: UIView!
    
    //MARK: - Setup
    func setupCell(foodName: String, foodBody: String, foodImage: UIImage) {
        foodNameLabel.text  = foodName
        foodImageView.image = foodImage
        typeFoodLabel.text  = foodBody
    }    
}
