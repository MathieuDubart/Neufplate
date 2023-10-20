//
//  TitlingState.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class TitlingState: StateProtocol {
    enum TitlingError: Error {
        case NoState, NoNftFound
    }
    var neufplate: Neufplate
    
    init(neufplate: Neufplate) {
        self.neufplate = neufplate
    }
    
    func onTitling() async throws -> String? {
        neufplate.nft = Nft()
        let nftTitle = await CorporateBsClient().generateCorporateBs()
        guard let nft = neufplate.nft else { throw TitlingError.NoNftFound }
        nft.title = nftTitle
        
        neufplate.changeToState(MakingCollisionState(neufplate: self.neufplate))
        guard let state = neufplate.state else { throw TitlingError.NoState }
        
        
        print("### Debug --- Inside titling state function")
        
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
