//
//  UserDefaults+Extension.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

extension UserDefaults {
    
    /// Saves a model of any type to UserDefaults
    func save<T: Codable>(_ object: T, forKey key: String) {
        do {
            let data = try JSONEncoder().encode(object)
            set(data, forKey: key)
        } catch {
            print("Failed to save \(T.self):", error)
        }
    }

    /// Loads a model of any type from UserDefaults
    func load<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        guard let data = data(forKey: key) else { return nil }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Failed to load \(T.self):", error)
            return nil
        }
    }
}
