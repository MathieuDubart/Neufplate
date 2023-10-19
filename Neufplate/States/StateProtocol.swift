//
//  StateProtocol.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

protocol StateProtocol {
    var neufplate: Neufplate { get set }
    
    func onTitling() async throws-> String?
    func onMakingCollision() throws -> String?
    func onGenerate() throws -> String?
}
