//
//  ProfileViewModel.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - ProfileViewModel
final class ProfileViewModel: ObservableObject {
    
    // MARK: - Public Properties
    @Published var state: ViewState = .idle
    
    let id: String
    let coordinator: ProfileCoordinator
    
    // MARK: - Private Properties
    private let networkService: HomeDetailsNetworkServiceProtocol

    // MARK: - Init
    init(
        networkService: HomeDetailsNetworkServiceProtocol,
        coordinator: ProfileCoordinator,
        id: String
    ) {
        self.networkService = networkService
        self.coordinator = coordinator
        self.id = id
    }

    // MARK: - Deinit
    deinit {
        print("💥 deinit 💥 ProfileView")
    }

    // MARK: - Public Methods
    @MainActor
    func fetch() async {
        state = .loading
        do {
            let result = try await networkService.fetchData(by: id)
            print("Fetched: \(result.message)")
            state = .idle
        } catch {
            state = .error(error.localizedDescription)
        }
    }

    // MARK: - Public Methods
    func didTap(on navigationStep: ProfileNavigationStep) {
        coordinator.push(navigationStep)
    }
}
