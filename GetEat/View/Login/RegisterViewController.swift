//
//  RegisterViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 06/06/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Bem-vindo 🎊"
    }
    
    //MARK: - Functions
    private func createUser() {
        let usernameTF = usernameTextField.text
        let passwordTF = passwordTextField.text
        guard let username = usernameTF else { return }
        guard let password = passwordTF else { return }
        
        if username.isEmpty || password.isEmpty {
            print("The field is empty 😔")
        } else {
            print("Now, has a value 🥳")
            print("Username is: \(username)")
            print("Password is: \(password)")
        }
    }
    
    //MARK: - Actions
    @IBAction func registerUserAction(_ sender: UIButton) {
        createUser()
    }
}
