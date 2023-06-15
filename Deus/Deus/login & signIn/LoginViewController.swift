//
//  LoginViewController.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit

class LoginViewController: UIViewController {

    var sceneDelegate = SceneDelegate()
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var logPassword: UITextField!
    @IBOutlet weak var forgotPSWD: UILabel!
    
    @IBOutlet weak var emailError : UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEmail.delegate = self
        logPassword.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        passwordError.isHidden = true
        emailError.isHidden = true
     
    }
    
    
    @IBAction func logInBtnTap(_ sender: Any) {
//        if let email = loginEmail.text, let password = logPassword.text{
//            if email == "" && password == ""{
//                fieldEmptyError()
//            }else if email == "" {
//                validEmail()
//            }else if password == "" {
//                pswdfieldempty()
//            }else if Validations.Shared.isValidMailInput(input: email) {
//                validEmail()
//            }else if Validations.Shared.isValidPassword(password: password) {
//                validPassword()
//            }else if Validations.Shared.isValidPassword(password: password) && Validations.Shared.isValidMailInput(input: email) {
//                print(" login ")
//                //authentication()
//            }
//        }
        
      navigation()
    }
    
    @IBAction func FBLogInTap(_ sender: Any) {
        
        
    }
    @IBAction func appleLoginTap(_ sender: Any) {
        
    }
    

}

// valiadtions
extension LoginViewController: UITextFieldDelegate{

    
    func fieldEmptyError(){
        passwordError.text = "Enter Password"
        emailError.text = "Enter Email"
        
        passwordError.isHidden = false
        emailError.isHidden = false
    }
    
    func emailFieldempty(){
        emailError.text = "Enter Email"
        emailError.isHidden = false
    }
    func pswdfieldempty(){
        passwordError.text = "Enter Password"
        passwordError.isHidden = false
    }
    func validEmail(){
        emailError.text = "Enter valid Email Id"
        emailError.isHidden = false
    }
    func validPassword(){
        passwordError.text = "Enter valid Password"
        passwordError.isHidden = false
    }
    
    
    func navigation(){
        
        UserDefaults.standard.set(true, forKey: "logIn_status")
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as! TabBarViewController
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = yourVC
        self.navigationController?.popToRootViewController(animated: true)

    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == loginEmail {
            emailError.isHidden = true
        }else if textField == logPassword {
            passwordError.isHidden = true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == loginEmail{
            let result = Validations.Shared.isValidMailInput(input: textField.text!)
            if !result{
                validEmail()
            }else{
                emailError.isHidden = true
            }
        }else if textField == logPassword{
            let result = Validations.Shared.isValidPassword(password: textField.text!)
            if !result{
                validPassword()
            }else{
                passwordError.isHidden = true
            }
        }
    }
}
