//
//  BottomButtons.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 23.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct BottomButtons {
    
    @ObservableState
    struct State: Equatable {

        var urlToOpen: URL?
        var globalSettings: GlobalSettings = GlobalSettings(privacyPolicyLink: "https://www.example.com/privacy")

    }
    
    enum Action {
        case termsButtonTapped
        case restoreButtonTapped
        case privacyButtonTapped
    }
    
    @Dependency(\.openURL) var openURL
    

    
    var body: some ReducerOf<BottomButtons> {
        Reduce { state, action in
            switch action {

            case .termsButtonTapped:
                return .none
            case .restoreButtonTapped:
                return .none
            case .privacyButtonTapped:
                guard let privacyLink: String = state.globalSettings.privacyPolicyLink,
                      let link = URL(string: privacyLink) else { return .none }
                return .run { _ in
                    await openURL.callAsFunction(link)
                }
            }
        }
    }
}

struct BottomButtonsView: View {
    let store: StoreOf<BottomButtons>
    var body: some View {
        HStack {
            Button{
                store.send(.termsButtonTapped)
            } label:{
                Text("Terms of Service")
                    .foregroundStyle(Color.mainText)
            }
            Spacer()

            Button{
                store.send(.restoreButtonTapped)
            } label:{
                Text("Restore")
                    .foregroundStyle(Color.mainText)
            }
            Spacer()

            Button{
                store.send(.privacyButtonTapped)
            } label:{
                Text("Privacy Policy")
                    .foregroundStyle(Color.mainText)
            }
        } .padding(.horizontal, 40)
    }
}
