//
//  HomeDetailsView.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

// MARK: - HomeDetailsView
struct HomeDetailsView: View {
    
    // MARK: - Public Properties
    @ObservedObject var viewModel: HomeDetailsViewModel
    
    // MARK: - Private Properties
    @State private var step: HomeNavigationStep?

    // MARK: - View
    var body: some View {
        ZStack {
            AppGradientBackground()
            VStack(spacing: 20) {
                Button {
                    viewModel.didTap(on: .pushSubscreen1)
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
