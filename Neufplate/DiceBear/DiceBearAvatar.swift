//
//  File.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

public class DiceBearAvatar: Avatar {
    public var url: String? = nil
    public var unwrappedUrl: String {
        url ?? "Error"
    }
    
    private var spriteType: DiceBearSpriteType
    
    public init(spriteType: DiceBearSpriteType) {
        self.spriteType = spriteType
    }
    
    public func generate(with hash: String? = nil) -> Void {
        let client = getClient();

        if let hash {
            url = client.getAvatarFromUrl(with: hash);
        } else {
            url = client.getRandomAvatarUrl()
        }
    }
    
    func getClient() -> AvatarClientProtocol {
        DiceBearClient.shared.setSpriteType(spriteType)
        return DiceBearClient.shared
    }
}

