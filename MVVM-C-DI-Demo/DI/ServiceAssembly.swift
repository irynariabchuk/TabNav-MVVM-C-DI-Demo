//
//  ServiceAssembly.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation
import Swinject

// MARK: - ServiceAssembly + Assembly
final class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(URLSessionProtocol.self) { _ in
            URLSession.shared
        }

        container.register(NetworkManagerProtocol.self) { resolver in
            let session = resolver.resolve(URLSessionProtocol.self)!
            return NetworkManager(session: session)
        }

        container.register(HomeNetworkServiceProtocol.self) { resolver in
            let networkManager = resolver.resolve(NetworkManagerProtocol.self)!
            return HomeNetworkService(networkManager: networkManager)
        }
        
        container.register(HomeDetailsNetworkServiceProtocol.self) { resolver in
            let networkManager = resolver.resolve(NetworkManagerProtocol.self)!
            return HomeDetailsNetworkService(networkManager: networkManager)
        }
    }
}

