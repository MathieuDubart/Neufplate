//
//  MakingCollisionState.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class MakingCollisionState: StateProtocol {
    var neufplate: Neufplate
    
    init() {}
    
    func onTitling() async -> String? {
        return nil
    }
    
    func onMakingCollision() -> String? {
        var nonce = 0
        var hash = ""
        
        while (!hash.starts(with: "0000")) {}
    }
    
    func onGenerate() -> String? {
        return nil
    }
}
