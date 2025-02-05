//
//  MainButton.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 22.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct MainButton {
    
    @ObservableState
    struct State: Equatable {
        var buttonText: String
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

struct MainButtonView: View {
    let store: StoreOf<MainButton>
    var body: some View {
        Button{
            
        } label:{
            Text(store.buttonText)
                .frame(minWidth: 0, maxWidth: 300)
                .padding()
                .background(Color.cyan)
                .foregroundStyle(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5.0, x:0, y:5)
            
        }
    }
}

