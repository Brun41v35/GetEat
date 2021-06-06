//
//  IngredientsViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

class IngredientsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var firstIngredientTextField: UITextField!
    @IBOutlet weak var secondIngredientTextField: UITextField!
    @IBOutlet weak var thirdIngredientTextField: UITextField!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationBar()
    }
    
    private func setupTextField() {
        firstIngredientTextField.layer.cornerRadius     = 8
        firstIngredientTextField.layer.borderWidth      = 1
        firstIngredientTextField.layer.borderColor      = UIColor.gray.cgColor
        
        secondIngredientTextField.layer.cornerRadius    = 8
        secondIngredientTextField.layer.borderWidth     = 1
        secondIngredientTextField.layer.borderColor     = UIColor.gray.cgColor
        
        thirdIngredientTextField.layer.cornerRadius     = 8
        thirdIngredientTextField.layer.borderWidth      = 1
        thirdIngredientTextField.layer.borderColor      = UIColor.gray.cgColor
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
