//
//  HomeCoordinatorView.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI
import Swinject

// MARK: - HomeCoordinatorView
struct HomeCoordinatorView: View {
    
    // MARK: - Public Properties
    @ObservedObject var coordinator: HomeCoordinator

    // MARK: - View
    var body: some View {
        HomeView(viewModel: coordinator.resolver.resolve(HomeViewModel.self)!)
            .applyNavigation(coordinator: coordinator)
            .navigationBarTitleDisplayMode(.large)
    }
}
