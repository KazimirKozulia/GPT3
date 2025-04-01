//
//  PaywallGetFullAccess.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 20.01.2025.
//
//


import SwiftUI
import ComposableArchitecture

@Reducer
struct PaywallGetFullAccess {
    
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
    
    var body: some ReducerOf<PaywallGetFullAccess> {
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

struct PaywallGetFullAccessScreen: View {
    let store: StoreOf<PaywallGetFullAccess>
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
                    .font(.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                
                Spacer()
                
                Text(Localizable.SecondPaywallScreen.Main.subtitle)
                    .font(Fonts.Roboto.regular.swiftUIFont(size: 18))
                    .foregroundStyle(.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
            
            Image(.manInSpaceship)
            
            Spacer()
            
            Text(Localizable.SecondPaywallScreen.try3Days)
                .font(Fonts.Roboto.regular.swiftUIFont(size: 15))
                .foregroundStyle(.mainText)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
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
    PaywallGetFullAccessScreen(
        store: StoreOf<PaywallGetFullAccess>(
            initialState: PaywallGetFullAccess.State(),
            reducer: { PaywallGetFullAccess() }
        )
    )
}



