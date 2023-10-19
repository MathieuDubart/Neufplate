//
//  ContentView.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var avatar = DiceBearAvatar(spriteType: .BOTTTS)
    @State private var builder: UserBuilder = UserBuilder()
    @State private var user: User?
    @State private var CBSClient = CorporateBsClient()
    @State private var generatedUrl = ""
    @State private var provider = Provider(providerType: .DICEBEAR, spriteType: DiceBearSpriteType.LORELEI)
    @State private var neufplate = Neufplate()
    
    
    var body: some View {
        VStack {
            Text(generatedUrl)
            Button("Generate URL") {
                avatar.generate()
                generatedUrl = avatar.unwrappedUrl
            }
            if let user {
                Text(user.toString())
            }
            Button("generate user") {
                user = try! builder
                    .addNames(firstname: "Jacob", lastname: "Tronc")
                    .addEmail("jacob.tronc@gmail.com")
                    .addPhone(number: "0450267598")
                    .build()
            }
            .task {
                let result = await neufplate.processWith(provider: provider, on: User.example)
                if let result {
                    print("Current NFT: \(result.title ?? "No title") \(result.hash ?? "No hash") \(result.avatar?.url ?? "No avatar")")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

