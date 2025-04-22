//
//  HomeViewModel.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - HomeViewModel
final class HomeViewModel: ObservableObject {
    
    // MARK: - Public Properties
    @Published var state: ViewState = .idle
    
    let categories: [Category] = [
        Category(name: "General", icon: "square.grid.2x2.fill", color: .blue),
        Category(name: "Transport", icon: "bus", color: .purple),
        Category(name: "Shopping", icon: "bag.fill", color: .pink),
        Category(name: "Bills", icon: "doc.text.fill", color: .orange),
        Category(name: "Entertainment", icon: "film.fill", color: .indigo),
        Category(name: "Grocery", icon: "leaf.fill", color: .green)
    ]

    // MARK: - Private Properties
    private let networkService: HomeNetworkServiceProtocol
    @Published var coordinator: HomeCoordinator

    // MARK: - Init
    init(
        networkService: HomeNetworkServiceProtocol,
        coordinator: HomeCoordinator
    ) {
        self.networkService = networkService
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    @MainActor
    func fetch() async {
        // TODO: - Just for example
        state = .loading

        do {
            let result = try await networkService.fetchData()
            print("Home Fetched: \(result.message)")
            state = .idle
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func didSelectCategory(_ category: Category) {
        coordinator.push(.details(id: category.name))
    }
}
