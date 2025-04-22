//
//  HomeDetailsNetworkService.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - HomeDetailsNetworkServiceProtocol
protocol HomeDetailsNetworkServiceProtocol {
    func fetchData(by searchText: String) async throws -> ErrorMain
}

// MARK: - HomeDetailsNetworkService
final class HomeDetailsNetworkService: HomeDetailsNetworkServiceProtocol {
    
    // MARK: - Private Properties
    private let networkManager: NetworkManagerProtocol
    
    // MARK: - Init
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    // MARK: - Public Methods
    func fetchData(by id: String) async throws -> ErrorMain {
        ErrorMain(code: 1000, message: "home details 2")
    }
}
