//
//  SceneDelegate.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let isLoggedIn =  UserDefaults.standard.value(forKey: "logIn_status") ?? false

         if isLoggedIn as! Bool {
                  print("User logged in")
                  let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
             let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as! TabBarViewController
                  self.window?.rootViewController = yourVC
                  self.window?.makeKeyAndVisible()
              }
              else {
                  print("User Not logged in")
                  let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "rootNAV") as! loginNavigationController
                  self.window?.rootViewController = yourVC
                  self.window?.makeKeyAndVisible()
              }

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

