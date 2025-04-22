//
//  BaseCoordinator.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI
import Swinject

/// Conform Step to this if it should be cached
protocol CacheKeyProvider {
    var cacheKey: String { get }
}

// MARK: - BaseCoordinator
/// Base class that automatically caches heavy ViewModels tied to a particular `Steps` element
/// and purges the cache whenever the element disappears from `path`.
class BaseCoordinator<Step: Steps>: ObservableObject {
    @Published public var path: [Step] = [] {
        didSet {
            purgeCache()
        }
    }
    
    // Weak‑value cache for ViewModels keyed by a string identifier
    private var cache: [String: AnyObject] = [:]
    
    // MARK: Caching helpers
    public func cachedObject<T: AnyObject>(key: String, _ factory: () -> T) -> T {
        if let cached = cache[key] as? T {
            return cached
        }
        let instance = factory()
        cache[key] = instance
        return instance
    }
    
    private func purgeCache() {
        // By default purge all – subclasses override if they need selective retention
        // Example: keep only those keys that are still present in path
        let liveKeys = path.compactMap {
            ($0 as? CacheKeyProvider)?.cacheKey
        }
        cache = cache.filter {
            liveKeys.contains($0.key)
        }
    }
    
    // MARK: Navigation helpers
    /// Push a new step onto the navigation stack.
    func push(_ step: Step) {
        path.append(step)
        print("🐾 \(path)")
    }
    
    /// Pop the last step (if any).
    func pop() {
        _ = path.popLast()
    }
}
