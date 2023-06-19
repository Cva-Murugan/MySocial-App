//
//  LoginViewController.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    var sceneDelegate = SceneDelegate()
    
  
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var logPassword: UITextField!
    @IBOutlet weak var forgotPSWD: UILabel!
    
    @IBOutlet weak var emailError : UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginEmail.delegate = self
        logPassword.delegate = self
        loadSpinner.isHidden = true
        loadSpinner.hidesWhenStopped = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        passwordError.isHidden = true
        emailError.isHidden = true
        
    }
    
    
    @IBAction func logInBtnTap(_ sender: Any) {
        if let email = loginEmail.text, let password = logPassword.text{
            if email == "" && password == ""{
                fieldEmptyError()
            }else if email == "" {
                validEmail()
            }else if password == "" {
                pswdfieldempty()
            }else if !Validations.Shared.isValidMailInput(input: email) {
                validEmail()
            }
            else if !Validations.Shared.isValidPassword(password: password) {
                validPassword()
            }else{
                loadSpinner.isHidden = false
                loadSpinner.startAnimating()
                print(" login ")
                login()
            }
        }
    }
  
        
    func login(){
        // Some@1234
        // someone@gamil.com
        let params: Parameters = [
            "email": loginEmail.text!,
            "password": logPassword.text!
        ]
            
        AF.request("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBsHxaY6BGrRawnxF2gtWHbPjWqzEsF4co", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 500).responseData { response in
                switch response.result {
                case .success(let data):
                    
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        
                        guard let _ = String(data: prettyJsonData, encoding: .ascii) else {
                            print("Error: Could print JSON in String")
                            return
                        }
                        
                        let apiData = LoginDataModel(fromDictionary: jsonObject)
                        if apiData.registered {
                            self.loadSpinner.stopAnimating()
                            // navigation to tabbar
                            self.navigation()
                            
                            UserDefaults.standard.set(true, forKey: "logIn_status")
                            
                            let token = apiData.idToken as String
                            UserDefaults.standard.set(token, forKey: "Token")
                            let email = apiData.email
                            UserDefaults.standard.set(email, forKey: "email")
                            let name = apiData.displayName
                            UserDefaults.standard.set(name, forKey: "displayName")
                            let localId = apiData.localId
                            UserDefaults.standard.set(localId, forKey: "localId")
                            
                        }else{
                            self.loadSpinner.stopAnimating()
                            print("-------------------login----------------------------")
                            /////////                                        self.emailAndPswdIncorrect()
                        }
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
                }
     }
        

        func navigation(){
            UserDefaults.standard.set(true, forKey: "logIn_status")
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as! TabBarViewController
            
            let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
            sceneDelegate.window!.rootViewController = yourVC
            self.navigationController?.popToRootViewController(animated: true)
        }
        
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
