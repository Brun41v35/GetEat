//
//  FoodDetailsViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 05/06/21.
//

import UIKit

class FoodDetailsViewController: UIViewController {
    
    //MARK: - Variables
    var foodName: String?
    var foodImage: UIImage?
    
    //MARK: - Outlets
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    //MARK: - Init
    convenience init(foodName: String, foodImage: UIImage) {
        self.init()
        self.foodName   = foodName
        self.foodImage  = foodImage
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupFoodInformation()
    }
    
    private func setupFoodInformation() {
        foodNameLabel.text  = foodName
        foodImageView.image = foodImage
    }
    
    //MARK: - Actions
    @IBAction func favoriteFoodAction(_ sender: UIButton) {
        listFoods.append(foodName!)
        listImageFoods.append(foodImage!)
        let modal = ModalViewController(titleModal: "Sucesso ☺️", messageModal: "Alimento adicionado com sucesso 🎊")
        modal.modalPresentationStyle    = .overFullScreen
        modal.modalTransitionStyle      = .crossDissolve
        present(modal, animated: true, completion: nil)
    }
}
