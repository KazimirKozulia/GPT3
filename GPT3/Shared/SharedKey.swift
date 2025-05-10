//
//  SharedKey.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 02.05.2025.
//
import SwiftUI
import ComposableArchitecture

extension SharedKey where Self == AppStorageKey<Bool> {
    static var isOnboardingPassed: Self {
        appStorage("isOnboardingPassed")
    }
}

extension SharedKey where Self == FileStorageKey<[Chat.Message]> {
    static var chatHistory: Self {
        fileStorage(.documentsDirectory.appending(component: "chatHistory.json"))
    }
}


