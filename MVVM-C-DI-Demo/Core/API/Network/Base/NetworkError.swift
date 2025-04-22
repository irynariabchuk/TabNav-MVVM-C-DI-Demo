//
//  NetworkError.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - NetworkError
enum NetworkError: Error {
    case invalidResponse
    case statusCode(Int)
    case noInternet
    case timeout
    case decodingError(DecodingError)
    case serverError(ErrorMain)
    case urlError(URLError)
    case unknown(String)
}

// MARK: - NetworkError + LocalizedError
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .serverError(let error):
            return "error.server_code".localizeWithFormat(arguments: error.message, error.code)
        case .noInternet:
            return "error.no_internet"
        case .timeout:
            return "error.timeout"
        case .statusCode(let code):
            return "error.http_status".localizeWithFormat(arguments: code)
        case .invalidResponse:
            return "error.invalid_response"
        case .decodingError(let decodingError):
            return "error.failed_decode".localizeWithFormat(arguments: decodingError.localizedDescription)
        case .urlError(let urlError):
            return "error.url".localizeWithFormat(arguments: urlError.localizedDescription)
        case .unknown(let message):
            return "error.unknown".localizeWithFormat(arguments: message)
        }
    }
}
