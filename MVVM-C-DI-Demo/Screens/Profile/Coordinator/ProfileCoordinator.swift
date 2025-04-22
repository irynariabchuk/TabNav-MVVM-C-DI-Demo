//
//  ProfileCoordinator.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Swinject
import SwiftUI

final class ProfileCoordinator: BaseCoordinator<ProfileNavigationStep> {
    
    let resolver: Resolver

    init(resolver: Resolver) {
        self.resolver = resolver
    }
}

extension ProfileCoordinator: Coordinator {
    
    func redirect(_ step: ProfileNavigationStep) -> some View {
        switch step {
        case .details:
            EmptyView()
        }
    }
}




