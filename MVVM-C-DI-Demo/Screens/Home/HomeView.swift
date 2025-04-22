//
//  HomeView.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import SwiftUI

// MARK: - HomeView
struct HomeView: View {
    
    // MARK: - Public Properties
    @ObservedObject var viewModel: HomeViewModel
    
    // MARK: - Body
    var body: some View {
        content
            .errorAlert(
                isPresented: .constant(viewModel.state.isError),
                errorMessage: viewModel.state.errorMessage
            )
            .navigationTitle("Home")
            .task {
                await viewModel.fetch()
            }
            .onAppear {
                print("🧙 Appear 🧙 HomeView")
            }
    }
    
    private var content: some View {
        ZStack {
            AppGradientBackground()
            categoryGrid
        }
    }
    
    private var categoryGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2),
            spacing: 20
        ) {
            ForEach(viewModel.categories) { category in
                categoryCard(for: category)
            }
        }
        .padding([.horizontal, .top])
    }
    
    private func categoryCard(for category: Category) -> some View {
        VStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .frame(height: 100)
                
                Image(systemName: category.icon)
                    .font(.system(size: 30))
                    .foregroundColor(category.color)
            }
            
            Text(category.name)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .onTapGesture {
            viewModel.didSelectCategory(category)
        }
    }
}
