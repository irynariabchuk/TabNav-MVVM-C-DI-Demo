//
//  APIConfig.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - APIConfig
struct APIConfig {
    
    static var baseURL: String {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_API_URL") as? String else {
            fatalError("BASE_API_URL not found in Info.plist")
        }
        
        return url
    }

    static var apiKey: String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY not found in Info.plist")
        }
        
        return key
    }
}
