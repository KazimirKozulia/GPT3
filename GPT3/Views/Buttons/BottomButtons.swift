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

//        @Shared(.generalPaywall) var generalPaywall = GeneralPaywall(data: [:])

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
                       guard let link = URL(string: "https://policies.google.com/privacy?hl=en-US") else { return .none }
                return .run { _ in
                    await openURL(link)
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
                Text(Localizable.BottomButton.Terms.text)
                    .foregroundStyle(Color.mainText)
                    .font(Fonts.Roboto.light.swiftUIFont(size: 15))
            }
            Spacer()

            Button{
                store.send(.restoreButtonTapped)
            } label:{
                Text(Localizable.BottomButton.Restore.text)
                    .foregroundStyle(Color.mainText)
                    .font(Fonts.Roboto.light.swiftUIFont(size: 15))
            }
            Spacer()

            Button{
                store.send(.privacyButtonTapped)
            } label:{
                Text(Localizable.BottomButton.Privacy.text)
                    .foregroundStyle(Color.mainText)
                    .font(Fonts.Roboto.light.swiftUIFont(size: 15))
            }
        } .padding(.horizontal, 40)
    }
}
