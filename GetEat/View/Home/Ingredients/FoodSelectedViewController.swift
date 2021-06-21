//
//  FoodSelectedViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 20/06/21.
//

import UIKit
import Lottie

class FoodSelectedViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var nameFood: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    @IBOutlet weak var viewAnimation: AnimationView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var nameIngredient: UILabel!
    
    //MARK: - Variables
    var name: String?
    var descriptionText: String?
    var ingredientsText: [Ingredient]?
    
    //MARK: - init
    convenience init(nameFood: String, descriptionLabel: String, ingredients: [Ingredient]) {
        self.init()
        self.name = nameFood
        self.descriptionText = descriptionLabel
        self.ingredientsText = ingredients
    }
     
    //MARK: - LifeCYcle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupAnimation()
        setupButton()
        title = "Detalhes do Alimento"
    }
    
    //MARK: - Setup
    private func setup() {
        nameFood.text = name
        descriptionLabel.text = descriptionText
        guard let listIngredient = ingredientsText else { return }
    }
    
    private func setupAnimation() {
        viewAnimation.play()
        viewAnimation.loopMode      = .loop
        viewAnimation.contentMode   = .scaleAspectFill
    }
    
    private func setupButton() {
        shareButton.layer.masksToBounds  = false
        shareButton.layer.shadowColor    = UIColor.black.cgColor
        shareButton.layer.shadowOpacity  = 0.5
        shareButton.layer.shadowOffset   = CGSize(width: 0, height: 10)
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        guard let nome = descriptionText else { return }
        let activityViewController = UIActivityViewController(activityItems: [nome], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
}
