//
//  DIResolver.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation
import Swinject

// MARK: - DependencyContainer
final class DependencyContainer {
  
    // MARK: - Public Properties
    let assembler: Assembler
    
    var resolver: Resolver {
        assembler.resolver
    }
    
    var homeCoordinator: HomeCoordinator {
         resolver.resolve(HomeCoordinator.self)!
     }

    // MARK: - Init
    init() {
        assembler = Assembler([
            ServiceAssembly(),
            ViewModelAssembly(),
            CoordinatorAssembly()
        ])
    }
}


// MARK: - CoordinatorAssembly +  Assembly
final class CoordinatorAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeCoordinator.self) { resolver in
            HomeCoordinator(resolver: resolver)
        }
        .inObjectScope(.container)
        
        container.register(ProfileCoordinator.self) { resolver in
            ProfileCoordinator(resolver: resolver)
        }
        .inObjectScope(.container)
        
        container.register(AppCoordinator.self) { resolver in
            AppCoordinator(resolver: resolver)
        }
        .inObjectScope(.container)
    }
}
