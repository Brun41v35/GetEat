//
//  LoginViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - LifeCyle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupTextField()
    }
    
    private func setupTextField() {
        usernameTextField.layer.cornerRadius    = 8
        usernameTextField.layer.borderWidth     = 1
        usernameTextField.layer.borderColor     = UIColor.gray.cgColor
        
        passwordTextField.layer.cornerRadius    = 8
        passwordTextField.layer.borderWidth     = 1
        passwordTextField.layer.borderColor     = UIColor.gray.cgColor
    }
    
    //MARK: - Functions
    private func isValidLogin() {
        guard let userName = usernameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if userName.isEmpty || password.isEmpty {
            print("You cannot login 😔")
            let modal = ModalViewController()
            modal.modalPresentationStyle    = .overFullScreen
            modal.modalTransitionStyle      = .crossDissolve
            present(modal, animated: true, completion: nil)
        } else {
            //MARK: TODO
            print("Welcome ☺️")
        }
    }
    
    //MARK: - Actions
    @IBAction func signButtonAction(_ sender: UIButton) {
        isValidLogin()
    }
}
