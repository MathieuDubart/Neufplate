//
//  AvatarClientProtocol.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

protocol AvatarClientProtocol {
    func getRandomAvatarUrl() -> String
    func getAvatarFromUrl(with seed: String?) -> String
}


