//
//  SignUpViewController.swift
//  Deus
//
//  Created by Novastrid on 14/06/23.
//

import UIKit
import Alamofire
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var fullnameErr : UILabel!
    @IBOutlet weak var phoneNumberErr : UILabel!
    @IBOutlet weak var emailErr : UILabel!
    @IBOutlet weak var passwordErr : UILabel!
    
    var validations = Validations()
    var db = Firestore.firestore()

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
    
        if let email = email.text, let password = password.text, let name = fullname.text, let phone = phoneNumber.text{
            if email == "" && password == "" && name == "" && phone == ""{
                fieldEmptyError()
            }else if email == "" {
                validEmail()
            }else if password == "" {
                pswdfieldempty()
            }else if !validations.isValidMailInput(input: email) {
                validEmail()
            }
            else if !validations.isValidPassword(password: password) {
                validPassword()
            }else if !validations.isValidPhoneNumber(phone) {
                validphone()
            }else if !validations.validateName(name: name){
                validName()
            }else{
                print(" login ")
                register()
            }
        }
    }
    
    func register(){
        let params: Parameters = [
            "email" : email.text!,
            "password" : password.text!
            ]

        AF.request("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBsHxaY6BGrRawnxF2gtWHbPjWqzEsF4co", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 500).responseData { response in
            switch response.result {
                case .success(let data):
            
                        do {
                            guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                                print("Error: Cannot convert data to JSON object")
                                return
                            }
                            
                            let apiData = RegistrDataModel(fromDictionary: jsonObject)
                            if (apiData.token != nil) {
                                
                                // navigation to tabbar
                                self.navigation()
//                                var phone:[String : Any]  = ["phoneNumber": self.phoneNumber.text!]
//                                var name:[String: Any] = ["FullName": self.fullname.text!]
//                                var email:[String: Any] = ["Email": self.fullname.text!]
                                
                                let userDetails : [String: Any] = [
                                    "phoneNumber": self.phoneNumber.text!,
                                    "FullName": self.fullname.text!,
                                    "Email": self.email.text!
                                ]
                                
                                let token = apiData.token as String
                                let localId = apiData.localId as String
                                
                                
                                self.db.collection("User_details").document(localId).setData(userDetails){ err in
                                    if let err = err {
                                        print("Error writing document: \(err)")
                                    } else {
                                        print("Document successfully written!")
                                    }
                                }
                                
                                
                                
                                UserDefaults.standard.set(true, forKey: "logIn_status")
                                UserDefaults.standard.set(localId, forKey: "localId")
                                UserDefaults.standard.set(token, forKey: "Token")
                                UserDefaults.standard.set( self.phoneNumber.text,forKey: "phoneNumber")
                                UserDefaults.standard.set(self.fullname.text, forKey: "displayName")
                                UserDefaults.standard.set(self.email.text,forKey: "email")
                                
                                
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


    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == fullname{
            if textField.text != ""  {
                let result = Validations.Shared.validateName(name: textField.text!)
                if !result{
                    validName()
                }else{
                    fullnameErr.isHidden = true
                }
            }else{
                fullnameErr.isHidden = true
            }

        }else if textField == email{
            if textField.text != ""{
                let result = Validations.Shared.isValidMailInput(input: textField.text!)
                if !result{
                    validEmail()
                }else{
                    emailErr.isHidden = true
                }
            }else{
                emailErr.isHidden = true
            }
            
        }else if textField == phoneNumber{
            if textField.text != ""{
                let result = Validations.Shared.isValidPhoneNumber(textField.text!)
                if !result{
                    validphone()
                }else{
                    phoneNumberErr.isHidden = true
                }
            }else{
                phoneNumberErr.isHidden = true
            }
            
        }else if textField == password{
            if textField.text != ""{
                let result = Validations.Shared.isValidPassword(password: textField.text!)
                if !result{
                    validPassword()
                }else{
                    passwordErr.isHidden = true
                }
            }else{
                passwordErr.isHidden = true
            }
        }
    }
}
