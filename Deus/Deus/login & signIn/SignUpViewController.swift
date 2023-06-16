//
//  SignUpViewController.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var fullnameErr : UILabel!
    @IBOutlet weak var phoneNumberErr : UILabel!
    @IBOutlet weak var emailErr : UILabel!
    @IBOutlet weak var passwordErr : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fullname.delegate = self
        phoneNumber.delegate = self
        email.delegate = self
        password.delegate = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fullnameErr.isHidden = true
        passwordErr.isHidden = true
        emailErr.isHidden = true
        phoneNumberErr.isHidden = true
    }
    
    func navigation(){
        UserDefaults.standard.set(true, forKey: "logIn_status")
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "tabBarVC") as! TabBarViewController
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = yourVC
        self.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func SignUpBtnTap(_ sender: Any) {
        register()
    }
    
    func register(){
        let params: Parameters = [
            "email" : "\(email.text!)",
            "password" : "\(password.text!)"
            ]

        AF.request("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBsHxaY6BGrRawnxF2gtWHbPjWqzEsF4co", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 500).responseData { response in
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
                    
                            let apiData = RegistrDataModel(fromDictionary: jsonObject)
                            if (apiData.token != nil) {
                                
                                // navigation to tabbar
                                self.navigation()
                                
                                UserDefaults.standard.set(true, forKey: "logIn_status")
                                
                                let token = apiData.token as String
                                
                                UserDefaults.standard.set(token, forKey: "Token")
                            }else{
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
    }
    
}

// validation
extension SignUpViewController: UITextFieldDelegate{
    
    func fieldEmptyError(){
        fullnameErr.text = "Enter Name"
        phoneNumberErr.text = "Enter Phone Number"
        passwordErr.text = "Enter Password"
        emailErr.text = "Enter Email"
        
        passwordErr.isHidden = false
        emailErr.isHidden = false
        fullnameErr.isHidden = false
        phoneNumberErr.isHidden = false
    }
    
    func emailFieldempty(){
        emailErr.text = "Enter Email"
        emailErr.isHidden = false
    }
    
    func pswdfieldempty(){
        passwordErr.text = "Enter Password"
        passwordErr.isHidden = false
    }
    
    func validEmail(){
        emailErr.text = "Enter valid Email Id"
        emailErr.isHidden = false
    }
    
    func validPassword(){
        passwordErr.text = "Enter valid Password"
        passwordErr.isHidden = false
    }

    func nameFieldempty(){
        fullnameErr.text = "Enter Name"
        emailErr.isHidden = false
    }
    
    func phonefieldempty(){
        phoneNumberErr.text = "Enter Phone Numebr"
        phoneNumberErr.isHidden = false
    }
    
    func validName(){
        fullnameErr.text = "Enter valid Name"
        fullnameErr.isHidden = false
    }
    
    func validphone(){
        phoneNumberErr.text = "Enter valid Phone number"
        phoneNumberErr.isHidden = false
    }

//    func textFieldDidBeginEditing(_ textField: UITextField) { /// recheck
//
//        if textField == email {
//            fullnameErr.isHidden = true
//            passwordErr.isHidden = true
//            emailErr.isHidden = true
//            phoneNumberErr.isHidden = true
//        }else if textField == password {
//            fullnameErr.isHidden = true
//            passwordErr.isHidden = true
//            emailErr.isHidden = true
//            phoneNumberErr.isHidden = true
//        }else if textField == fullname{
//            fullnameErr.isHidden = true
//            passwordErr.isHidden = true
//            emailErr.isHidden = true
//            phoneNumberErr.isHidden = true
//        }else{
//            fullnameErr.isHidden = true
//            passwordErr.isHidden = true
//            emailErr.isHidden = true
//            phoneNumberErr.isHidden = true
//        }
//    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == fullname{
            let result = Validations.Shared.validateName(name: textField.text!)
            if !result{
                validName()
            }else{
                fullnameErr.isHidden = true
            }
        }else if textField == email{
            let result = Validations.Shared.isValidMailInput(input: textField.text!)
            if !result{
                validEmail()
            }else{
                emailErr.isHidden = true
            }
        }else if textField == phoneNumber{
            let result = Validations.Shared.isValidPhoneNumber(textField.text!)
            if !result{
                validphone()
            }else{
                phoneNumberErr.isHidden = true
            }
        }else if textField == password{
            let result = Validations.Shared.isValidPassword(password: textField.text!)
            if !result{
                validPassword()
            }else{
                passwordErr.isHidden = true
            }
        }
        
    }
    
}
