//
//  HomeDetailsView.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

// MARK: - HomeDetailsView
struct ProfileView: View {
    
    // MARK: - Public Properties
    @ObservedObject var viewModel: ProfileViewModel
    @State private var step: HomeNavigationStep?

    // MARK: - View
    var body: some View {
        ZStack {
            AppGradientBackground()
            
            Button {
                viewModel.didTap(on: .details)
            } label: {
                Text("Profile")
            }
        }
        .errorAlert(
            isPresented: .constant(viewModel.state.isError),
            errorMessage: viewModel.state.errorMessage
        )
        .task {
            await viewModel.fetch()
        }
        .onAppear {
            print("🧙 Appear 🧙 ProfileView")
        }
    }
}
