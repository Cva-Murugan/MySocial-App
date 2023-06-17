//
//  UserModel.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import Foundation

// register
struct RegistrDataModel{
    var token: String!
    var userName: String!
    var password: String!
    var refersToken: String!
    var localId: String!
    
    init(fromDictionary dictionary:[String:Any]){
        self.token = dictionary["idToken"] as? String ?? ""
        self.userName = dictionary["displayName"] as? String ?? ""
        self.password = dictionary["password"] as? String ?? ""
        self.refersToken  = dictionary["refreshToken"] as? String ?? ""
        self.localId = dictionary["localId"] as? String ?? ""
    }
}

//login
struct LoginDataModel{

    var displayName : String!
    var email : String!
    var idToken : String!
    var kind : String!
    var localId : String!
    var registered : Bool!

    init(fromDictionary dictionary: [String:Any]){
        displayName = dictionary["displayName"] as? String ?? ""
        email = dictionary["email"] as? String ?? ""
        idToken = dictionary["idToken"] as? String ?? ""
        kind = dictionary["kind"] as? String ?? ""
        localId = dictionary["localId"] as? String ?? ""
        registered = dictionary["registered"] as? Bool ?? false
    }


    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if displayName != nil{
            dictionary["displayName"] = displayName
        }
        if email != nil{
            dictionary["email"] = email
        }
        if idToken != nil{
            dictionary["idToken"] = idToken
        }
        if kind != nil{
            dictionary["kind"] = kind
        }
        if localId != nil{
            dictionary["localId"] = localId
        }
        if registered != nil{
            dictionary["registered"] = registered
        }
        return dictionary
    }
}


struct userData{
    var userName: String!
    var email: String!
    var imgUrl: String!
    var localId: String!
    
    init(fromDictionary dictionary: [String:Any]){
        self.userName = dictionary["displayName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.imgUrl = dictionary["photoUrl"] as? String ?? ""
        self.localId = dictionary["localId"] as? String ?? ""
    }
}

