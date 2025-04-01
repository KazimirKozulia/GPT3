//
//  Extension.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 20.02.2025.
//
import SwiftUI
import ComposableArchitecture

//extension SharedKey where Self == AppStorageKey<Bool> {
//    static var isOnboardingPassed: Self {
//        appStorage("isOnboardingPassed")
//    }
//}

extension SharedKey where Self == AppStorageKey<Bool> {
    static var isOnboardingPassed: Self {
        appStorage("isOnboardingPassed")
    }
}

extension SharedKey where Self == InMemoryKey<GeneralPaywall> {
    static var generalPaywall: Self {
        inMemory("generalPaywall")
    }
}
