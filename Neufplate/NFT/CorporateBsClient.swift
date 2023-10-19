//
//  CorporateBsClient.swift
//  Neufplate
//
//  Created by Mathieu DUBART on 19/10/2023.
//

import Foundation

class CorporateBsClient {
    enum CorporateBSClientError: Error {
        case NoData, ParseFailed
    }
    
    public static let shared = CorporateBsClient()
    private let apiUrl = "https://corporatebs-generator.sameerkumar.website/";
    
    public init() {}
    
    public func generateCorporateBs() async -> String {
        return parseJson( try! await makeRequest())
    }
    
    public func makeRequest(on hash: String? = nil) async throws -> Data {
        do {
            let url = URL(string: apiUrl)!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return data
        } catch {
            throw CorporateBSClientError.NoData
        }
    }
    
    public func parseJson(_ data:Data) -> String{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let hash = try! decoder.decode(Phrase.self, from: data)
        return hash.phrase
    }
}
