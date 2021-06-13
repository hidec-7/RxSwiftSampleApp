//
//  UserModel.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/21.
//

import Foundation
import Firebase

class UserModel {
    
    var email: String
    var name: String
    var createdAt: Timestamp
    var age: String
    var residence: String
    var hobby: String
    var introdunction: String
    
//    "name": self?.name,
//    "age": self?.age,
//    "email": self?.email,
//    "residence": self?.residence,
//    "hobby": self?.hobby,
//    "introduction": self?.introduction
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
        self.age = dic["age"] as? String ?? ""
        self.residence = dic["residence"] as? String ?? ""
        self.hobby = dic["hobby"] as? String ?? ""
        self.introdunction = dic["introduction"] as? String ?? ""
    }
}
