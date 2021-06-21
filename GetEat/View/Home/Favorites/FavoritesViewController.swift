//
//  FavoritesViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

var listFoods: [String]         = []
var listTypeFoods: [String]     = []
var listImageFoods: [UIImage]   = []

class FavoritesViewController: UIViewController {
    
    //MARK: - Variables
    var food: String?
    var imageFood: UIImage?
    var typeFood: String?
    
    //MARK: - Init
    convenience init(foodName: String, foodImage: UIImage, typeFood: String) {
        self.init()
        self.food       = foodName
        self.imageFood  = foodImage
        self.typeFood   = typeFood
    }
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: - Setup
    private func setup() {
        setupNavigationBar()
        setupTableView()
        setupSearch()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.12, green: 0.13, blue: 0.15, alpha: 1.00)
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
    }
    
    private func setupTableView() {
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    private func setupSearch() {
        searchView.layer.masksToBounds      = false
        searchView.layer.cornerRadius       = 8
        if self.traitCollection.userInterfaceStyle == .dark {
            searchView.layer.shadowColor    = UIColor.white.cgColor
        } else {
            searchView.layer.shadowColor    = UIColor.black.cgColor
        }
        searchView.layer.shadowOpacity      = 0.2
        searchView.layer.shadowOffset       = CGSize(width: 0, height: 5)
    }
    
    private func setupListFavorites() {
    }
}

//MARK: - Extension
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoritesTableViewCell
        cell.setupCell(foodName: listFoods[indexPath.row],
                       foodBody: listTypeFoods[indexPath.row],
                       foodImage: listImageFoods[indexPath.row])
        return cell
    }
}
