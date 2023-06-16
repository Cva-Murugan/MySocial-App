//
//  Validations.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import Foundation
import UIKit

class Validations{
    
    static let Shared = Validations()
    
    func isValidMailInput(input: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: input)
    }
    
    public func isValidPassword(password: String) -> Bool {

        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        //let passwordRegex = "^(?=.*\\d)(?=.*[a-z])[0-9a-z]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    
    func isValidPhoneNumber(_ PhoneNumber : String) -> Bool{
        
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{10,16}$"
          let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
          return phoneTest.evaluate(with: PhoneNumber)
//        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
//        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
//        let result =  phoneTest.evaluate(with: PhoneNumber)
//        return result
    }
    
    public func validateName(name: String) ->Bool {
        // Length be 18 characters max and 3 characters minimum, you can always modify.
        let nameRegex = "\\A\\w{4,18}\\z"
        let trimmedString = name.trimmingCharacters(in: .whitespaces)
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
     }
    
    
    func emailFieldempty(email textField: UITextField){
        if let _ = textField.text?.isEmpty{
            textField.text = "Enter Phone Numebr"
            textField.isHidden = false
        }
    }
    
    func validEmail(email textField: UITextField){
        textField.text = "Enter valid Email Id"
        textField.isHidden = false
    }
    
    func passwordFieldempty(password textField: UITextField){
        if let _ = textField.text?.isEmpty{
            textField.text = "Enter Phone Numebr"
            textField.isHidden = false
        }
    }
   
    func validPassword(password textField: UITextField){
        textField.text = "Enter valid Password"
        textField.isHidden = false
    }

    func nameFieldempty(name textField: UITextField){
        if let _ = textField.text?.isEmpty{
            textField.text = "Enter Phone Numebr"
            textField.isHidden = false
        }
    }
    
    func validName(name textField: UITextField){
        textField.text = "Enter valid Name"
        textField.isHidden = false
    }
    
    func phonefieldempty(PhoneNumber textField: UITextField){
        if let _ = textField.text?.isEmpty{
            textField.text = "Enter Phone Numebr"
            textField.isHidden = false
        }
    }
    
    func validphone(textField: UITextField){
        textField.text = "Enter valid Phone number"
        textField.isHidden = false
    }
    
    func validate(_ textField: UITextField) -> Bool {
        guard let text = textField.text,
            !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty else {
                
         return false
        }
        return true
    }
    
//    if let text = descriptionLabel.text, !text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
//
//    }
    
}
