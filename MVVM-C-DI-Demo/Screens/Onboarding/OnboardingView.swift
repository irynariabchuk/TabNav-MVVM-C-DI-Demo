//
//  OnboardingView.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

// MARK: - OnboardingView
struct OnboardingView: View {
    
    // MARK: - Public Properties
    @ObservedObject var viewModel: OnboardingViewModel
    
    // MARK: - Body
    var body: some View {
        content
            .onAppear {
                print("🧙 Appear 🧙 OnboardingView")
            }
    }
    
    private var content: some View {
        ZStack {
            AppGradientBackground()
            VStack {
                HStack {
                    Spacer()
                    Button {
                        viewModel.completeOnboarding()
                    } label: {
                        Text("SKIP")
                    }
                }
                Spacer()
                Text("Onboarding")
                Spacer()
            }
        }
    }
}
