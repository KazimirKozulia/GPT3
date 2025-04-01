//
//  SettingBottomButtons.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 26.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct SettingBottomButtons {
    
    @ObservableState
    struct State: Equatable {
        var buttonsText: String
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<SettingBottomButtons> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
                return .none
            }
        }
    }
}

struct SettingBottomButtonsView: View {
    let store: StoreOf<SettingBottomButtons>
    var body: some View {
        VStack {
            Button{
                
            } label:{
                Text(store.buttonsText)
                    .font(Fonts.Roboto.medium.swiftUIFont(size: 18))
                    .foregroundStyle(Color.mainText)
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .background(Color.backgroundBottomButtons)
                    .cornerRadius(20)
                    .shadow(color: .gray, radius: 5.0, x:0, y:5)
            }
        }
    }
}

