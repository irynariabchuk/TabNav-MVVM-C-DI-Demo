//
//  HTTPMethod.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - HTTPMethod
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    
    var allowsBody: Bool {
        switch self {
        case .get:
            return false
        case .post:
            return true
        }
    }
}
