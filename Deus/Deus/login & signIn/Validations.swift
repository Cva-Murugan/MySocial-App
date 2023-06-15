//
//  Validations.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import Foundation

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
        
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
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
}
