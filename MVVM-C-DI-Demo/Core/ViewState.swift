//
//  ViewState.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

//  MARK: - ViewState
enum ViewState {
    case idle
    case loading
    case error(String)
}

extension ViewState {
    var isLoading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }

    var isError: Bool {
        if case .error = self { 
            return true
        }
        return false
    }

    var errorMessage: String? {
        if case let .error(message) = self {
            return message
        }
        return nil
    }
}
