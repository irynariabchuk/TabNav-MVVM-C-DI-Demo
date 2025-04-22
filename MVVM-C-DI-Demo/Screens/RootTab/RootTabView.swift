//
//  RootTabView.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import UIKit
import SwiftUI
import Swinject

// MARK: - RootTabView
struct RootTabView: View {
    
    // MARK: - Public Properties
    @Environment(\.resolver) private var resolver
    
    // MARK: - Init
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        UITabBar.appearance().tintColor = .orange
        UITabBar.appearance().unselectedItemTintColor = .gray
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = UIColor.black
        navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        navAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
    }
    
    // MARK: - View
    var body: some View {
        TabView {
            HomeCoordinatorView(coordinator: resolver.resolve(HomeCoordinator.self)!)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileCoordinatorView(coordinator: resolver.resolve(ProfileCoordinator.self)!)
                .tabItem {
                    Label("Details", systemImage: "square.stack.3d.down.right")
                }
        }
        .toolbarBackground(Color.yellow, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .tint(.orange)
    }
}

