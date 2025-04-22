//
//  Coordinator.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

// MARK: - Coordinator
protocol Coordinator: ObservableObject {
    associatedtype CoordinatorSteps: Steps
    associatedtype CoordinatorView: View

    var path: [CoordinatorSteps] { get set }

    @ViewBuilder
    func redirect(_ path: CoordinatorSteps) -> CoordinatorView
}
