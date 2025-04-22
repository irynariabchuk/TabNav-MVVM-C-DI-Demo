//
//  AppCoordinatorView.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI
import Swinject

// MARK: - AppCoordinatorView
struct AppCoordinatorView: View {
    
    // MARK: - Public Properties
    @ObservedObject var coordinator: AppCoordinator

    // MARK: - View
    var body: some View {
        coordinator.buildRoot()
    }
}
