//
//  RobotHashClient.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

public enum RobotHashSpriteType: String {
    case ROBOTS = "set1"
    case MONSTERS = "set2"
    case HEADS = "set3"
    case CATS = "set4"
}

public class RobotHashClient: AvatarClientProtocol {
    
    public static let shared = RobotHashClient()
    private var spriteType = "set3"
    private let apiUrl = "https://robohash.org/"
    
    private init() {}
    
    public func getRandomAvatarUrl() -> String {
        return "\(apiUrl):\(Int.random(in: 0...10000)).svg?set=\(spriteType)"
    }
    
    public func getAvatarFromUrl(with hash: String? = nil) -> String {
        guard let hash else {
            return "API call failed: hash is empty."
        }
        
        return "\(apiUrl):\(hash).svg?set=\(spriteType)"
    }
    public func setSpriteType(_ newType:RobotHashSpriteType) -> Void{
        spriteType = newType.rawValue
    }
}

