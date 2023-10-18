//
//  BuilderProtocol.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

protocol BuilderProtocol {
    func addNames(firstname: String, lastname: String) throws -> UserBuilder
    func addPhone(number: String) throws -> UserBuilder
    func addEmail(_ email:String) throws -> UserBuilder
    func addAddress(_ address: String) throws -> UserBuilder
    func _verify() throws
    func build() -> User
}
