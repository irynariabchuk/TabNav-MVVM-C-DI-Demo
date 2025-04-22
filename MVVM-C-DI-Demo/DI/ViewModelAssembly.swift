//
//  ViewModelAssembly.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation
import Swinject

// MARK: - ViewModelAssembly + Assembly
final class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(OnboardingViewModel.self) { resolver, onFinish in
            OnboardingViewModel(
                onFinish: onFinish
            )
        }
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(
                networkService: resolver.resolve(HomeNetworkServiceProtocol.self)!,
                coordinator: resolver.resolve(HomeCoordinator.self)!
            )
        }
        container.register(HomeDetailsViewModel.self) { (resolver: Resolver, id: String) in
            HomeDetailsViewModel(
                coordinator: resolver.resolve(HomeCoordinator.self)!,
                id: id
            )
        }
        container.register(ProfileViewModel.self) { (resolver: Resolver, id: String) in
            ProfileViewModel(
                networkService: resolver.resolve(HomeDetailsNetworkServiceProtocol.self)!, 
                coordinator: resolver.resolve(ProfileCoordinator.self)!,
                id: id
            )
        }
    }
}
