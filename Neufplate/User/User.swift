//
//  User.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

struct User {
    var firstname: String
    var lastname: String
    var address: String?
    var avatars: Array<Avatar>?
    var phone: String?
    var email: String?
    
    static var example = User(firstname: "John", lastname: "Doe", address: "Adresse", avatars: [], phone: "066765655", email: "ma.dubart@formation-cci.fr")
    
    func toString() -> String {
        return "\(firstname) \(lastname), \(address ?? "No address"), \(phone ?? "No phone"), \(email ?? "No email")"
    }
}
