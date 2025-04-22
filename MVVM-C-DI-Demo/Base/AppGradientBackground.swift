//
//  AppGradientBackground.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

// MARK: - AppGradientBackground
struct AppGradientBackground: View {
    
    var body: some View {
        LinearGradient(
            colors: [.black, .purple.opacity(0.7)],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
