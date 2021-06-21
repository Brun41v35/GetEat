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
        setupNavigationBar()
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
        let foodDetails = FoodDetailsViewController(foodName: foods[indexPath.row],
                                                    foodImage: imageFoods[indexPath.row]!,
                                                    foodBody: typeFoods[indexPath.row],
                                                    delegate: self)
        navigationController?.present(foodDetails, animated: true, completion: nil)
    }
}

extension FoodViewController: FoodDetailsViewControllerDelegate {
    func didCloseModal() {
        let web = WebViewController()
        navigationController?.pushViewController(web, animated: true)
    }
}
