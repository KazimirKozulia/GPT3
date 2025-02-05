//
//  BackCrossButton.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 23.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct BackCrossButton {
    
    @ObservableState
    struct State: Equatable {
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<BackCrossButton> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            }
        }
    }
}

struct BackCrossButtonView: View {
    let store: StoreOf<BackCrossButton>
    var body: some View {
        Button{
            store.send(.buttonTapped)
        } label:{
            Image(.cross)
            
        }
    }
}
