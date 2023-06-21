//
//  FourthViewController.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextBtnTap(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "isLanuchedBefore")
       
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "rootNAV") as! loginNavigationController
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = yourVC
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
}
