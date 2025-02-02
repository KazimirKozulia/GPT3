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
        var isLoading: Bool = false
        
    }
    
    enum Action {
        case buttonTapped
        case updateLoadingState(Bool)
    }
    
    var body: some ReducerOf<MainButton> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            case let .updateLoadingState(loading):
                state.isLoading = loading
            return .none
            }
        }
    }
}

struct MainButtonView: View {
    let store: StoreOf<MainButton>
    var body: some View {
            Button(action:{
                store.send(.buttonTapped) 
            }, label:{
                if store.isLoading {
                    ProgressView()
                } else {
                    Text(store.buttonText)
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .background(Color.cyan)
                        .foregroundStyle(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 5.0, x:0, y:5)
                    
                }
            })
    }
}

