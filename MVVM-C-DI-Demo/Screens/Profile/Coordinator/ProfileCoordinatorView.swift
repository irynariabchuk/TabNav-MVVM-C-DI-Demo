//
//  ProfileCoordinatorView.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

struct ProfileCoordinatorView: View {
    
    @ObservedObject var coordinator: ProfileCoordinator

    var body: some View {
        ProfileView(viewModel: coordinator.resolver.resolve(ProfileViewModel.self, argument: "test")!)
            .applyNavigation(coordinator: coordinator)
    }
}

