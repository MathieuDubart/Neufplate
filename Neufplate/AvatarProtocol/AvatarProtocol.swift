//
//  Avatar.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//
import Foundation

protocol Avatar{
    var url: String? { get }
    
    func generate(with hash: String?) -> Void
    func getClient() -> AvatarClientProtocol
}
