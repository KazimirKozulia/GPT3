//
//  BottomButtons.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 23.01.2025.
//

import SwiftUI
import ComposableArchitecture

//enum BottomButtonsType {
//    case terms
//    case restore
//    case privacy
//}
@Reducer
struct BottomButtons {
    
    @ObservableState
    struct State: Equatable {
//        let buttonsType: BottomButtonsType
        var urlToOpen: URL?
    }
    
    enum Action {
        case termsButtonTapped
        case restoreButtonTapped
        case privacyButtonTapped
    }
    
    var body: some ReducerOf<BottomButtons> {
        Reduce { state, action in
            switch action {
            case .termsButtonTapped:
                //                switch state.buttonsType {
                //                case .terms:
                //
                //                case .restore:
                //
                //                case .privacy:
                //
                //                }
            return .none
            case .restoreButtonTapped:
                return .none
            case .privacyButtonTapped:
                return .none
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
