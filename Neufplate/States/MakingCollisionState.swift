//
//  MakingCollisionState.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation
import CryptoKit
import CommonCrypto

class MakingCollisionState: StateProtocol {
    enum CollisionErrors: Error {
        case NftNotFound, NoNftTitle, NoState
    }
    var neufplate: Neufplate

    init(neufplate: Neufplate) {
        self.neufplate = neufplate
    }
    
    func onTitling() async throws -> String? {
        return nil
    }
    
    func onMakingCollision() throws -> String? {
        var nonce = 0
        var hash: Data
        var stringifiedHash = ""
        
        guard let nft = neufplate.nft else { throw CollisionErrors.NftNotFound }
        guard let nftTitle = nft.title else { throw CollisionErrors.NoNftTitle }
        
        while (!stringifiedHash.starts(with: "0000")) {
            hash = sha256(data: Data("\(nonce)#\(nftTitle)".utf8))
            stringifiedHash = String(decoding: hash, as: UTF8.self)
            nonce += 1
            print("### Debug - generating Hash")
        }
        nft.hash = stringifiedHash
        neufplate.changeToState(GeneratingState(neufplate: self.neufplate))
        
        guard let state = neufplate.state else { throw CollisionErrors.NoState }
        try? state.onGenerate()
        
        return stringifiedHash
    }
    
    func onGenerate() throws -> String? {
        return nil
    }
    
    func sha256(data : Data) -> Data {
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }
        return Data(hash)
    }
}
