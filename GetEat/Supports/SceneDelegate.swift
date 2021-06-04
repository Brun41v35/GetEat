//
//  SceneDelegate.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let windowScene:UIWindowScene = scene as! UIWindowScene
        self.window = UIWindow(windowScene: windowScene)
        let loginViewController = LoginViewController(nibName: "LoginViewController", bundle : nil)
        self.window!.rootViewController = loginViewController
        self.window!.makeKeyAndVisible()
        
        guard let _ = (scene as? UIWindowScene) else { return }
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

