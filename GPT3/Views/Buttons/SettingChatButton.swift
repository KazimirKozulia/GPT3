//
//  SettingChatButton.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 26.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct SettingChatButton {
    
    @ObservableState
    struct State: Equatable {
        var buttonsText: String
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<SettingChatButton> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            }
        }
    }
}

struct SettingChatButtonView: View {
    let store: StoreOf<SettingChatButton>
    var body: some View {
        VStack {
            Button{
                
            } label:{
                Text(store.buttonsText)
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .background(Color.indigo)
                    .foregroundStyle(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 5.0, x:0, y:5)
            }
        }
    }
}

