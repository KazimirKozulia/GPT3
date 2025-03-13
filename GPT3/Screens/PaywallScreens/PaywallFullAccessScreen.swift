//
//  PaywallFullAccessScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 20.01.2025.

import SwiftUI
import ComposableArchitecture

@Reducer
struct PaywallFullAccess {
    
    @ObservableState
    struct State: Equatable {
        var continueButton = MainButton.State(buttonText: "CONTINUE")
        var bottomButtons = BottomButtons.State()
        var backCrossButton = BackCrossButton.State()
    }
    
    enum Action {
        case continueButton(MainButton.Action)
        case bottomButtons(BottomButtons.Action)
        case backCrossButton(BackCrossButton.Action)
    }
    
    var body: some ReducerOf<PaywallFullAccess> {
        Reduce { state, action in
            switch action {
            case .continueButton:
                return .none
            case .bottomButtons(.termsButtonTapped):
                return .none
            case .bottomButtons(.restoreButtonTapped):
                return .none
            case .bottomButtons(.privacyButtonTapped):
                return .none
            case .backCrossButton:
                return .none
                
            }
        }
    }
}

struct PaywallFullAccessScreen: View {
    let store: StoreOf<PaywallFullAccess>
    var body: some View {
        VStack{
            HStack{
                BackCrossButtonView(
                    store: store.scope(
                        state: \.backCrossButton,
                        action: \.backCrossButton))
                
                Spacer()
                
            }.padding(.horizontal, 20)

            Spacer()
            
            VStack{
                Text("Unlimited \n Full Accesss to \n All Features")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
            }
            
            Spacer()
            
            Image(.artificalIntelligence)
            
            Spacer()
            
            MainButtonView(
                store: store.scope(
                    state: \.continueButton,
                    action: \.continueButton)
            )
            
            Spacer()
            
            BottomButtonsView(
                store: store.scope(
                    state: \.bottomButtons,
                    action: \.bottomButtons))
       
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.mainBackground)
    }
}

#Preview {
    PaywallFullAccessScreen(
        store: StoreOf<PaywallFullAccess>(
            initialState: PaywallFullAccess.State(),
            reducer: { PaywallFullAccess() }
        )
    )
}

