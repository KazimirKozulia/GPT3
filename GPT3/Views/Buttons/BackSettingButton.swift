//
//  BackSettingButton.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 26.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct BackSettingButton {
    
    @ObservableState
    struct State: Equatable {
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<BackSettingButton> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            }
        }
    }
}

struct BackSettingButtonView: View {
    let store: StoreOf<BackSettingButton>
    var body: some View {
        Button{
            store.send(.buttonTapped)
        } label:{
            Image(.backSetting)
            
        }
    }
}
