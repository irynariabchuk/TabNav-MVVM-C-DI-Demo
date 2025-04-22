//
//  HomeDetailsView.swift
//  Test
//
//  Created by Iryna Riabchuk on 18.04.2025.
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
            VStack(spacing: 20) {
                Button {
                    viewModel.didTapOnNavigateToSubScreen1()
                } label: {
                    Text("Push SubScreen1View")
                }
                Button {
                    step = .presentSubscreen2
                } label: {
                    Text("Present SubScreen2View")
                }
            }
        }
        .sheet(item: $step) {
            viewModel.coordinator.redirect($0)
        }
        .toolbar {
            titleToolbar
        }
        .errorAlert(
            isPresented: .constant(viewModel.state.isError),
            errorMessage: viewModel.state.errorMessage
        )
        .task {
            await viewModel.fetch()
        }
        .onAppear {
            print("🧙 Appear 🧙 HomeDetailsView")
        }
    }

    private var titleToolbar: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(viewModel.id)
                .foregroundColor(.white)
                .font(.headline)
        }
    }
}
