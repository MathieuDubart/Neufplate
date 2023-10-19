//
//  Provider.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class Provider {
    enum ProviderType {
        case ROBOTHASH, DICEBEAR
    }
    
    public var providerType: ProviderType
    public var spriteType: Any
    
    init(providerType: ProviderType, spriteType: Any) {
        self.providerType = providerType
        self.spriteType = spriteType
    }
}
