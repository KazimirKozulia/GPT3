//
//  Extension.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 20.02.2025.
//
import SwiftUI
import ComposableArchitecture

extension String {
    var localizable: String {
        return NSLocalizedString(self, comment: "")
    }
}

//extension PersistenceReaderKey where Self == InMemoryKey<GeneralPaywall> {
//    static var generalPaywall: Self {
//        inMemory("generalPaywall")
//    }
//}

extension SharedKey where Self == AppStorageKey<Bool> {
    static var isOnboardingPassed: Self {
        appStorage("isOnboardingPassed")
    }

    static var isATTEnabled: Self {
        appStorage("isATTEnabled")
    }

    static var isPushSetuped: Self {
        appStorage("isPushSetuped")
    }
}
