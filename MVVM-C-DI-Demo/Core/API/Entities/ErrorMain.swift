//
//  ErrorMain.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - ErrormainResponse
struct ErrorMainResponse: Decodable {
    let error: ErrorMain
}

// MARK: - ErrorMain
struct ErrorMain: Decodable {
    let code: Int
    let message: String
}
