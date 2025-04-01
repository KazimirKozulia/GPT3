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
        var continueButton = MainButton.State(buttonText: Localizable.Continue.Button.text)
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
                Text(Localizable.FirstPaywallScreen.Main.title)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                
                Text(Localizable.FirstPaywallScreen.Billed.title + " " + Localizable.FirstPaywallScreen.Usd.title)
                    .font(Fonts.Roboto.regular.swiftUIFont(size: 22))
                    .foregroundStyle(.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Text(Localizable.FirstPaywallScreen.Renewable.title)
                    .foregroundStyle(Color.mainText)
                    .font(Fonts.Roboto.light.swiftUIFont(size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
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

