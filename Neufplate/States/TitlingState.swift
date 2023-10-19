//
//  TitlingState.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class TitlingState: StateProtocol {
    enum TitlingError: Error {
        case NoState
    }
    var neufplate: Neufplate
    
    init(neufplate: Neufplate) {
        self.neufplate = neufplate
    }
    
    func onTitling() async throws -> String? {
        let nftTitle = await CorporateBsClient().generateCorporateBs()
        
        neufplate.changeToState(MakingCollisionState(neufplate: self.neufplate))
        guard let state = neufplate.state else { throw TitlingError.NoState }
        
        try? state.onMakingCollision()
        
        return nftTitle
    }
    
    func onMakingCollision() throws -> String? {
        return nil
    }
    
    func onGenerate() throws -> String? {
        return nil
    }
    
    
}
