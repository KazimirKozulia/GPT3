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
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<BottomButtons> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            }
        }
    }
}

struct BottomButtonsView: View {
    let store: StoreOf<BottomButtons>
    var body: some View {
        HStack {
            Button(action:{
                
            }, label:{
                Text("Terms os Service")
                    .foregroundStyle(Color.mainText)
            })
            Spacer()

            Button(action:{
                
            }, label:{
                Text("Restore")
                    .foregroundStyle(Color.mainText)
            })
            Spacer()

            Button(action:{
                
            }, label:{
                Text("Privacy Policy")
                    .foregroundStyle(Color.mainText)
            })
        } .padding(.horizontal, 40)
    }
}
