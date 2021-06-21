//
//  SceneDelegate.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit
import Lottie

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let login = LoginViewController()        
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene         = windowScene
        window?.rootViewController  = createIngredients()
        window?.makeKeyAndVisible()
    }
    
    private func createTabbar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().barTintColor = UIColor(red: 0.12, green: 0.13, blue: 0.15, alpha: 1.00)
        UITabBar.appearance().tintColor = .systemOrange
        tabbar.viewControllers          = [createIngredients(),
                                           createSearch(),
                                           createFoods(),
                                           createFavorite()]
        return tabbar
    }
    
    private func createIngredients() -> UINavigationController {
        let ingredientsVC         = IngredientsViewController()
        ingredientsVC.title       = "Ingredientes"
        ingredientsVC.tabBarItem  = UITabBarItem(title: "Ingredientes", image: UIImage(systemName: "book.closed"), tag: 0)
        
        return UINavigationController(rootViewController: ingredientsVC)
    }
    
    private func createSearch() -> UINavigationController {
        let searchVC        = SearchViewController()
        searchVC.title      = "Refeições"
        searchVC.tabBarItem = UITabBarItem(title: "Procurar", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        return UINavigationController(rootViewController: searchVC)
        
    }
    
    private func createFoods() -> UINavigationController {
        let foodsVC         = FoodViewController()
        foodsVC.title       = "Alimentos"
        foodsVC.tabBarItem  = UITabBarItem(title: "Alimentos", image: UIImage(systemName: "tuningfork"), tag: 2)
        
        return UINavigationController(rootViewController: foodsVC)
    }
    
    private func createFavorite() -> UINavigationController {
        let favoriteVC          = FavoritesViewController()
        favoriteVC.title        = "Favoritos"
        favoriteVC.tabBarItem   = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "heart.fill"), tag: 3)
        
        return UINavigationController(rootViewController: favoriteVC)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

