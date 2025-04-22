//
//  OnboardingViewModel.swift
//  MVVM-C-DI-Demo
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

// MARK: - OnboardingViewModel
final class OnboardingViewModel: ObservableObject {
    
    // MARK: - Private Properties
    private let userDefaults: UserDefaults
    private let finishHandler: () -> Void

    // MARK: - Init
    init(userDefaults: UserDefaults = .standard, onFinish: @escaping () -> Void) {
        self.userDefaults = userDefaults
        self.finishHandler = onFinish
    }
    
    // MARK: - Deinit
    deinit {
        print("💥 deinit 💥 Onboarding")
    }

    // MARK: - Public Methods
    func completeOnboarding() {
        userDefaults.set(true, forKey: "didFinishOnboarding")
        finishHandler()
    }

    var shouldSkipOnboarding: Bool {
        userDefaults.bool(forKey: "didFinishOnboarding")
    }
}
