//
//  ProfileNavigationStep.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - ProfileNavigationStep
enum ProfileNavigationStep: Steps, CacheKeyProvider, Identifiable {
    case details
    
    var id: String {
        switch self {
        case .details:
            return "details"
        }
    }
    
    var cacheKey: String {
        id
    }
}

