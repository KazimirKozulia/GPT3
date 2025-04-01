//
//  SettingButton.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 26.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct SettingButton {
    
    @ObservableState
    struct State: Equatable {
    }
    
    enum Action {
        case buttonTapped
    }
    
    var body: some ReducerOf<SettingButton> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
            return .none
            }
        }
    }
}

struct SettingButtonView: View {
    let store: StoreOf<SettingButton>
    var body: some View {
        Button{
            store.send(.buttonTapped)
        } label:{
            Image(.settingGear)
            
        }
    }
}
