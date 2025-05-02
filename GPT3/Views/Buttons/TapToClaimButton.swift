//
//  TapToClaimButton.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 27.04.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct TapToClaimButton {
    
    @ObservableState
    struct State: Equatable {
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<MainButton> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
                return .none
            }
        }
    }
}

struct TapToClaimButtonView: View {
    let store: StoreOf<TapToClaimButton>
    var body: some View {
        Button{
            store.send(.buttonTapped)
        } label: {
            
        Text(Localizable.Free.Premium.Button.text)}
            .font(Fonts.Roboto.light.swiftUIFont(size: 16))
            .foregroundStyle(.indigo)
            .background(Color.yellow)
            .cornerRadius(20)
        
    }
}

