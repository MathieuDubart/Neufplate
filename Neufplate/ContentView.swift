//
//  ContentView.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var provider = Provider(providerType: .ROBOTHASH, spriteType: RobotHashSpriteType.CATS)
    @State private var neufplate = Neufplate()
    @State public var nft: Nft = Nft()
    @State private var startTime = Date()
    @State private var timerString = "0.00"
    
    var body: some View {
        VStack {
            VStack{
                if let avatar = nft.avatar {
                    Text(nft.title ?? "No title")
                    AsyncImage(url: URL(string: avatar.url ?? "https://api.dicebear.com/7.x/lorelei/svg?seed=00007c92194d84d6803a15dd8ef4d5579cffb04d896f425643fca95509102876"))
                        .scaledToFit()
                }
            }
            .frame(width: 300, height: 300)
            
            Text("Time spent to generate NFT: \(timerString)")
                .padding(.vertical)
            Button {
                startTime = Date()
                
                Task {
                    let result = await neufplate.processWith(provider: provider, on: User.example)
                    if let result {
                        nft = result
                        print("Current NFT: \(result.title ?? "No title") \(result.hash ?? "No hash") \(result.avatar?.url ?? "No avatar")")
                        
                        // -
                        timerString = String(format: "%.2f", (Date().timeIntervalSince( self.startTime)))
                    }
                }
                
            } label: {
                Text("COUILLE")
            }
            .padding()
            .buttonStyle(.plain)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

