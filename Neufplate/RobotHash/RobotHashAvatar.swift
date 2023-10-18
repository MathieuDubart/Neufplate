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
    
    public init() {}
    
    public func generate(with hash: String? = nil) -> Void {
        let client = getClient();

        if let hash {
            url = client.getAvatarFromUrl(with: hash);
        } else {
            url = client.getRandomAvatarUrl()
        }
    }
    
    func getClient() -> AvatarClientProtocol {
        return RobotHashClient.shared
    }
}
