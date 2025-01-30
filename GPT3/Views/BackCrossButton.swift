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
//        var cross: UIImage
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
        Button(action:{
            store.send(.buttonTapped)
        }, label:{
            Image(.cross)
            
        })
    }
}
