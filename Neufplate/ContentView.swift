//
//  ContentView.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 18/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var avatar = DiceBearAvatar()
    @State private var builder: UserBuilder = UserBuilder()
    @State private var user: User?
    @State private var CBSClient = CorporateBsClient()
    
    @State private var generatedUrl = ""
    
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
                let result = await CBSClient.generateCorporateBs()
                print("API Phrase: \(result)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

