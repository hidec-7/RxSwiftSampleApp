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
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
    }
}
