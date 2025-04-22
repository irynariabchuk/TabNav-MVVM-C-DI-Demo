//
//  NavigationSetupModifier.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

// MARK: - NavigationSetupModifier
struct NavigationSetupModifier<CoordinatorType: Coordinator>: ViewModifier {
    
    // MARK: - Body
    @ObservedObject var coordinator: CoordinatorType

    // MARK: - Body
    func body(content: Content) -> some View {
        NavigationStack(path: $coordinator.path) {
            content
                .navigationDestination(for: CoordinatorType.CoordinatorSteps.self) { step in
                    coordinator.redirect(step)
                }
        }
    }
}
