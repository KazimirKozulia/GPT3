//
//  GPT3App.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 18.01.2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct GPT3App: App {
    var body: some Scene {
        WindowGroup {
            OnboardingScreens(
                store: StoreOf<Onboarding>(
                    initialState:
                        Onboarding
                        .State(myType: .first),
                    reducer: { Onboarding() }
                )
            )
        }
    }
}
