//
//  WelcomeViewController.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit

class WelcomeViewController: UIViewController {

    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logInBtnTap(_ sender: Any) {
        let vc = storyBoard.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
 
    @IBAction func signUpBtntap(_ sender: Any) {
        let vc = storyBoard.instantiateViewController(withIdentifier: "signupVC") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
