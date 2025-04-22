//
//  ResolverKey.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI
import Swinject

// MARK: -  ResolverKey + EnvironmentKey
private struct ResolverKey: EnvironmentKey {
    static var defaultValue: Resolver = Assembler().resolver
}

extension EnvironmentValues {
    var resolver: Resolver {
        get { self[ResolverKey.self] }
        set { self[ResolverKey.self] = newValue }
    }
}
