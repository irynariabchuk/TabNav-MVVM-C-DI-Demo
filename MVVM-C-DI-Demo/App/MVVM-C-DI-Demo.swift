//
//  SwiftUITemplateApp.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI
import Swinject

@main
struct SwiftUITemplateApp: App {
    
    // MARK: - Private Properties
    private let container = DependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            let appCoordinator = container.resolver.resolve(AppCoordinator.self)!
            AppCoordinatorView(coordinator: appCoordinator)
                .environment(\.resolver, container.resolver)
        }
    }
}
