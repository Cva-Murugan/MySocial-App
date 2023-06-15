//
//  ProfileViewController.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import UIKit

class ProfileViewController: UIViewController {

    lazy var sceneDelegate = SceneDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logOutBtnTap(_ sender: Any) {
        navigation()
    }
    

    func navigation(){
        
        UserDefaults.standard.set(false, forKey: "logIn_status")
       
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "rootNAV") as! loginNavigationController
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = yourVC
        
        self.navigationController?.popToRootViewController(animated: true)
            
    }
    
}
