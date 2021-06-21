//
//  GeneratedTableViewCell.swift
//  GetEat
//
//  Created by Mobile2you on 20/06/21.
//

import UIKit
import Kingfisher

class GeneratedTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var nameFood: UILabel!
    @IBOutlet weak var imageFood: UIImageView!
    
    //MARK: - Setup
    func setupCell(food: Food) {
        self.nameFood.text = food.name
    }
}
