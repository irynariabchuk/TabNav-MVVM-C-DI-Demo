//
//  HomeDetailsViewModel.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - HomeDetailsViewModel
final class HomeDetailsViewModel: ObservableObject {
    
    // MARK: - Public Properties
    let id: String
    let coordinator: HomeCoordinator

    // MARK: - Init
    init(
        coordinator: HomeCoordinator,
        id: String
    ) {
        self.coordinator = coordinator
        self.id = id
    }

    // MARK: - Deinit
    deinit {
        print("💥 deinit 💥 HomeDetailsViewModel")
    }

    // MARK: - Public Methods
    func didTap(on navigationStep: HomeNavigationStep) {
        coordinator.push(navigationStep)
    }
}
