//
//  UserBuilder.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

extension String {
    func isEmpty() -> Bool{
        if self.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return true
        }
        
        return false
    }
}

class UserBuilder: BuilderProtocol {
    enum BuilderErrors: Error {
        case emptyNames, missingInformations
    }
    
    var firstname: String?
    var lastname: String?
    var address: String?
    var phone: String?
    var email: String?

    
    var user: User?
    
    init() {}
    
    func addNames(firstname: String, lastname: String) throws -> UserBuilder {
        if firstname.isEmpty() || lastname.isEmpty() {
            throw BuilderErrors.emptyNames
        }
        
        self.firstname = firstname
        self.lastname = lastname
        return self
    }
    
    func addPhone(number: String) throws -> UserBuilder {
        if number.isEmpty() {
            throw BuilderErrors.missingInformations
        }
        
        self.phone = number
        return self
    }
    
    func addEmail(_ email: String) throws -> UserBuilder {
        if email.isEmpty() {
            throw BuilderErrors.missingInformations
        }
        self.email = email
        return self
    }
    
    func addAddress(_ address: String) throws -> UserBuilder {
        if address.isEmpty() {
            throw BuilderErrors.missingInformations
        }
        self.address = address
        return self
    }
    
    internal func _verify() throws {
        if firstname == nil || lastname == nil { throw BuilderErrors.emptyNames }
        if phone == nil && email == nil { throw BuilderErrors.missingInformations }
    }
    
    func build() -> User {
        try? _verify()
        
        user = User(firstname: self.firstname!, lastname: self.lastname!, phone: self.phone, email: self.email)
    
        return user!
    }
}
