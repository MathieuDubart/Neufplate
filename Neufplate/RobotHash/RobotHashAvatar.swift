//
//  RobotHashAvatar.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import Foundation

public class RobotHashAvatar: Avatar {
    public var url: String? = nil
    public var unwrappedUrl: String {
        url ?? ""
    }
    
    private var spriteType: RobotHashSpriteType
    
    public init(spriteType: RobotHashSpriteType) {
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
        RobotHashClient.shared.setSpriteType(spriteType)
        return RobotHashClient.shared
    }
}

