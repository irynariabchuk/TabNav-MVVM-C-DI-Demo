//
//  Endpoint.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - Endpoint
enum Endpoint {
    case test(String)
        
    var path: String {
        switch self {
        case .test(let text):
            return "/current.json?q=\(text)"
        }
    }
    
    var url: URL? {
        return URL(string: "https://" + APIConfig.baseURL + path + "&key=\(APIConfig.apiKey)")
    }
}
