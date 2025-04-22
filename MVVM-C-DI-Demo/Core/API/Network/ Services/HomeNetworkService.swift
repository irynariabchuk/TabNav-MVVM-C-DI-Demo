//
//  HomeNetworkService.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - HomeNetworkServiceProtocol
protocol HomeNetworkServiceProtocol {
    func fetchData() async throws -> ErrorMain
}

// MARK: - HomeNetworkService
final class HomeNetworkService: HomeNetworkServiceProtocol {
    
    // MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol
    
    // MARK: - Init
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    // MARK: - Public Methods
    func fetchData() async throws -> ErrorMain {
        /*
        guard let url = Endpoint.test(searchText).url else {
            throw URLError(.badURL)
        }
        
        let model: ExampleModel = try await performRequest(
            url: url,
            method: .get,
            headers: nil,
            body: nil,
            responseType: ExampleModel.self
        )
        
        return model
         */
        ErrorMain(code: 1000, message: "test")
    }
}
