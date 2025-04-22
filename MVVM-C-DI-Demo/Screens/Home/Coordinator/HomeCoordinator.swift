//
//  HomeCoordinator.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI
import Swinject

// MARK: - HomeCoordinator
final class HomeCoordinator: BaseCoordinator<HomeNavigationStep> {
    
    // MARK: - Public Properties
    var resolver: Resolver
    
    // MARK: - Init
    init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension HomeCoordinator: Coordinator {
    
    @ViewBuilder
    func redirect(_ path: HomeNavigationStep) -> some View {
        switch path {
        case .details(let id):
            let vm = cachedObject(key: id) {
                self.resolver.resolve(HomeDetailsViewModel.self, argument: id)!
            }
            HomeDetailsView(viewModel: vm)
                .navigationBarTitleDisplayMode(.inline)
        case .pushSubscreen1:
            EmptyView()
        case .presentSubscreen2:
            EmptyView()
            /*
             let coordinator = EmptyViewCoordinator(resolver: resolver, parent: self)
             EmptyView(viewModel: EmptyViewViewModel(coordinator: coordinator))
             */
        }
    }
}
