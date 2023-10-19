//
//  TitlingState.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class TitlingState: StateProtocol {
    var neufplate: Neufplate
    
    init(neufplate: Neufplate) {
        self.neufplate = neufplate
    }
    
    func onTitling() async -> String? {
        let nftTitle = await CorporateBsClient().generateCorporateBs()
        
        neufplate.changeToState(MakingCollisionState())
        guard let state = neufplate.state else { return nil }
        
        state.onMakingCollision()
        
        return nftTitle
    }
    
    func onMakingCollision() -> String? {
        return nil
    }
    
    func onGenerate() -> String? {
        return nil
    }
    
    
}
