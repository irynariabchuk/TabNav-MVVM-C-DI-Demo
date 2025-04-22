//
//  AppCoordinator.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import  SwiftUI
import Swinject

// MARK: - AppCoordinator
final class AppCoordinator: ObservableObject {
    
    // MARK: - AppFlow
    enum AppFlow {
        case onboarding
        case main
    }
    
    // MARK: - Public Properties
    let resolver: Resolver
    
    // MARK: - Private Properties
    @Published private(set) var flow: AppFlow
    
    // MARK: - Init
    init(resolver: Resolver) {
        self.resolver = resolver
        
        let hasFinished = UserDefaults.standard.bool(forKey: "didFinishOnboarding")
        flow = hasFinished ? .main : .onboarding
    }
    
    // MARK: - Public Methods
    @ViewBuilder
    func buildRoot() -> some View {
        switch flow {
        case .onboarding:
            let viewModel = resolver.resolve(OnboardingViewModel.self, argument: {
                self.flow = .main
            })!
            OnboardingView(viewModel: viewModel)
        case .main:
            RootTabView()
        }
    }
}
