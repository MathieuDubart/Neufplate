//
//  DiceBearClient.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

public enum DiceBearSpriteType: String {
    case AVATAAARS = "avataaars"
    case BOTTTS = "bottts"
    case LORELEI = "lorelei"
}

public class DiceBearClient : AvatarClientProtocol {
    public static let shared = DiceBearClient()
    private var spriteType = "lorelei"
    private let apiUrl = "https://api.dicebear.com/7.x/"

    private init() {}
    
    public func getRandomAvatarUrl() -> String {
        return "\(apiUrl)\(spriteType)/png?seed=\(Int.random(in: 0...10000))"
    }
    
    public func getAvatarFromUrl(with hash: String? = nil) -> String {
        guard let hash else {
            return "API call failed: hash is empty."
        }
        
        return "\(apiUrl)\(spriteType)/png?seed=\(hash)"
    }
    public func setSpriteType(_ newType:DiceBearSpriteType) -> Void{
        spriteType = newType.rawValue
    }
}
