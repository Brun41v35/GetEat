//
//  GeneratedFoodViewController.swift
//  GetEat
//
//  Created by Mobile2you on 19/06/21.
//

import UIKit
import Lottie

class GeneratedFoodViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animationView: AnimationView!
    
    //MARK: - Variables
    var listFood: [String] = []
    var list: [Food] = []
    let cellIdentifier = "GeneratedTableViewCell"
    
    //MARK: - Init
    convenience init(listFood: [String]) {
        self.init()
        self.listFood = listFood
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationBar()
        setupTableView()
        setupCell()
        setupAnimation()
    }
    
    private func setupAnimation() {
        animationView.play()
        animationView.loopMode      = .loop
        animationView.contentMode   = .scaleAspectFill
    }
    
    private func setupCell() {
        tableView.register(UINib(nibName: "GeneratedTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupTableView() {
        Network.send(food: listFood) { (listFoodResponse) in
            DispatchQueue.main.async {
                self.list = listFoodResponse
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupNavigationBar() {
        title = "Alimentos encontrados"
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

//MARK: - Extension
extension GeneratedFoodViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneratedTableViewCell", for: indexPath) as! GeneratedTableViewCell
        let food = list[indexPath.row]
        cell.setupCell(food: food)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = list[indexPath.row]
        let foodSelected = FoodSelectedViewController(nameFood: food.name!,
                                                      descriptionLabel: food.welcomeDescription!,
                                                      ingredients: food.ingredients)
        navigationController?.pushViewController(foodSelected, animated: true)
    }
}
