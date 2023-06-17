//
//  ApiManager.swift
//  Deus
//
//  Created by Novastrid on 17/06/23.
//

import Foundation
import Alamofire

extension UserDefaults {
    static func resetDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}


class ApiManager{
    
    
    func uploadDataToDB(){
        let token: String = UserDefaults.standard.string(forKey: "Token")!
        
        let firstName: String = UserDefaults.standard.string(forKey: "displayName")!
        
        let params: Parameters = [
            "idToken" : token,
            "displayName": firstName
        ]
        
        
        AF.request("https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyBsHxaY6BGrRawnxF2gtWHbPjWqzEsF4co", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 500).responseData {  response in
            switch response.result {
            case .success(let data):
                
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
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
    
    func getDataFromDB(){
        
    }

    func loginWithDB(){
        
    }
    
    func registerInDB(){
        
    }
    
}
