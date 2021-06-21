//
//  IngredientsViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit
import Lottie

class IngredientsViewController: UIViewController {
    
    //MARK: - Variables
    var foods: [String] = []
    
    //MARK: - Outlets
    @IBOutlet weak var firstIngredientTextField: UITextField!
    @IBOutlet weak var secondIngredientTextField: UITextField!
    @IBOutlet weak var thirdIngredientTextField: UITextField!
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var foodButton: UIButton!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAnimation()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationBar()
        setupTextField()
        setupAnimation()
        setupButton()
    }
    
    private func setupTextField() {
        firstIngredientTextField.layer.cornerRadius     = 10
        firstIngredientTextField.layer.masksToBounds    = true
        
        secondIngredientTextField.layer.cornerRadius    = 10
        secondIngredientTextField.layer.masksToBounds   = true
        
        thirdIngredientTextField.layer.cornerRadius     = 10
        thirdIngredientTextField.layer.masksToBounds    = true
    }
    
    private func setupAnimation() {
        animationView.play()
        animationView.loopMode      = .loop
        animationView.contentMode   = .scaleAspectFill
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.12, green: 0.13, blue: 0.15, alpha: 1.00)
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
    }
    
    private func setupButton() {
        foodButton.layer.masksToBounds  = false
        foodButton.layer.shadowColor    = UIColor.black.cgColor
        foodButton.layer.shadowOpacity  = 0.5
        foodButton.layer.shadowOffset   = CGSize(width: 0, height: 10)
    }
    
    //MARK: - Action
    @IBAction func foodAction(_ sender: UIButton) {
        guard let firstValue    = firstIngredientTextField.text,
              let secondValue   = secondIngredientTextField.text,
              let thirdValue    = thirdIngredientTextField.text else { return }
        if firstValue.isEmpty || secondValue.isEmpty || thirdValue.isEmpty {
            let modal = ModalViewController(titleModal: "Alerta", messageModal: "Preencha os campos 😓")
            modal.modalPresentationStyle    = .overFullScreen
            modal.modalTransitionStyle      = .crossDissolve
            present(modal, animated: true, completion: nil)
        } else {
            foods.append(firstValue)
            foods.append(secondValue)
            foods.append(thirdValue)
            let generated = GeneratedFoodViewController(listFood: foods)
            navigationController?.pushViewController(generated, animated: true)
        }
    }
}
