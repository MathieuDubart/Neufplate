//
//  Neufplate.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class Neufplate {
    public var state:StateProtocol?
    public var nft: Nft?
    public var provider:Provider?
    public var user: User?
    
    init() {}
    
    func changeToState(_ newState: StateProtocol) -> Void {
        state = newState
    }
    
    func processWith(provider: Provider, on user:User) async -> Nft? {
        self.state = TitlingState(neufplate: self)
        self.provider = provider
        self.user = user
        self.nft = Nft()
            
        guard let state else { return nil }
        try? await state.onTitling()

        return self.nft
    }

}
