//
//  GeneratingState.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class GeneratingState: StateProtocol {
    enum GeneratingErrors: Error {
        case NoProvider, NftNotFound,UserNotFound, NftListNotFound
    }
    
    var neufplate: Neufplate
    
    init(neufplate: Neufplate) {
        self.neufplate = neufplate
    }
    
    func onTitling() async throws -> String? {
        return nil
    }
    
    func onMakingCollision() throws -> String? {
        return nil
    }
    
    func onGenerate() throws -> String? {
        guard let provider = neufplate.provider else { throw GeneratingErrors.NoProvider }
        let avatar:Avatar
        
        switch(provider.providerType) {
        case .DICEBEAR:
            avatar = DiceBearAvatar(spriteType: provider.spriteType as! DiceBearSpriteType)
            break;
        case .ROBOTHASH:
            avatar = RobotHashAvatar(spriteType: provider.spriteType as! RobotHashSpriteType)
            break;
        }
        
        guard let nft = neufplate.nft else { throw GeneratingErrors.NftNotFound }
        
        avatar.generate(with: nft.hash)
        nft.avatar = avatar
        
        guard let user = neufplate.user else {  throw GeneratingErrors.UserNotFound }
        guard var nftList = user.nftList else { throw GeneratingErrors.NftListNotFound }
        
        nftList.append(nft)
        
        return avatar.url
    }
    
    
}
