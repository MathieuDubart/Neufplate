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
        
        print("### Debug --- Inside making collision state function")

        
        var nonce = 0
        var hash: String = ""
        
        guard let nft = neufplate.nft else { throw CollisionErrors.NftNotFound }
        guard let nftTitle = nft.title else { throw CollisionErrors.NoNftTitle }
        
        while (!hash.starts(with: "00000")) {
            hash = sha256(textToEncode: "\(nonce)#\(nftTitle)")
            nonce += 1
        }
        
        print("### Debug --- Inside making collision state function -- after while statement")
        nft.hash = hash
        neufplate.changeToState(GeneratingState(neufplate: self.neufplate))
        
        guard let state = neufplate.state else { throw CollisionErrors.NoState }
        let _ = try? state.onGenerate()
        
        return hash
    }
    
    func onGenerate() throws -> String? {
        return nil
    }
    
    func sha256(textToEncode : String) -> String {
        let data = Data(textToEncode.utf8)
        var digest = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
