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
//        @Shared(.isOnboardingPassed) var isOnboardingPassed: Bool = false
        
        
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
            store.send(.buttonTapped)
        } label:{
            Text(store.buttonText)
                .font(Fonts.Roboto.medium.swiftUIFont(size: 20))
                .frame(minWidth: 0, maxWidth: 300)
                .padding()
                .background(Color.cyan)
                .foregroundStyle(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5.0, x:0, y:5)
            
        }
    }
}

