//
//  FoodDetailsViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 05/06/21.
//

import UIKit

protocol FoodDetailsViewControllerDelegate {
    func didCloseModal()
}

class FoodDetailsViewController: UIViewController {
    
    //MARK: - Variables
    var foodName: String?
    var foodImage: UIImage?
    var foodBody: String?
    var delegate: FoodDetailsViewControllerDelegate?
    
    //MARK: - Outlets
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var openWeb: GEButton!
    
    //MARK: - Init
    convenience init(foodName: String, foodImage: UIImage, foodBody: String, delegate: FoodDetailsViewControllerDelegate) {
        self.init()
        self.foodName   = foodName
        self.foodImage  = foodImage
        self.foodBody   = foodBody
        self.delegate   = delegate
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
        listTypeFoods.append(foodBody!)
        let modal = ModalViewController(titleModal: "Sucesso ☺️", messageModal: "Alimento adicionado com sucesso 🎊")
        modal.modalPresentationStyle    = .overFullScreen
        modal.modalTransitionStyle      = .crossDissolve
        present(modal, animated: true, completion: nil)
    }
    
    @IBAction func openWebAction(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate?.didCloseModal()
        }
    }
}
