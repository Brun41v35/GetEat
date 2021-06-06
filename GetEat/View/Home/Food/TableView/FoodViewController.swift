//
//  FoodViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

class FoodViewController: UIViewController {
    
    //MARK: - Variables
    var foods = ["Pizza", "Esfiha", "Mousse de Maracuja"]
    var typeFoods = ["Salgado", "Salgado", "Doce"]
    var imageFoods = [UIImage(named: "pizza"), UIImage(named: "esfiha"), UIImage(named: "maracuja")]
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationBar()
        setupTableView()
        setupSearch()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func setupSearch() {
        searchView.layer.masksToBounds  = false
        searchView.layer.cornerRadius   = 8
        searchView.layer.shadowColor    = UIColor.black.cgColor
        searchView.layer.shadowOpacity  = 0.2
        searchView.layer.shadowOffset   = CGSize(width: 0, height: 5)
    }
}

//MARK: - Extension
extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FoodTableViewCell
        cell.setupCell(foodName: foods[indexPath.row], typeFood: typeFoods[indexPath.row], imageFood: imageFoods[indexPath.row]!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foodDetails     = FoodDetailsViewController(foodName: foods[indexPath.row], foodImage: imageFoods[indexPath.row]!)
        navigationController?.present(foodDetails, animated: true, completion: nil)
    }
}
