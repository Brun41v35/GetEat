//
//  SearchViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Outlets    
    @IBOutlet weak var searchView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupSearch()
        setupNavigationBar()
    }
    
    private func setupSearch() {
        searchView.layer.masksToBounds  = false
        searchView.layer.cornerRadius   = 8
        searchView.layer.shadowColor    = UIColor.black.cgColor
        searchView.layer.shadowOpacity  = 0.5
        searchView.layer.shadowOffset   = CGSize(width: 0, height: 10)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.12, green: 0.13, blue: 0.15, alpha: 1.00)
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
    }
    
    //MARK: - Actions
    @IBAction func typeFoodAction(_ sender: UIButton) {
        let typeFood = TypeFoodViewController()
        navigationController?.pushViewController(typeFood, animated: true)
    }
}
