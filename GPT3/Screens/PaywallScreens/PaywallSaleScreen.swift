//
//  PaywallSaleScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 21.01.2025.
//
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct PaywallSale {
    
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
    
    var body: some ReducerOf<PaywallSale> {
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

struct PaywallSaleScreen: View {
    let store: StoreOf<PaywallSale>
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
                Text(Localizable.ThirdPaywallScreen.Main.title)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                
                Spacer()
                HStack{
                    Text(Localizable.ThirdPaywallScreen.Main.subtitle)
                        .font(Fonts.Roboto.regular.swiftUIFont(size: 18))
                        .foregroundStyle(.mainText)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
//                    Button {
//                        
//                    } label: {
//                        Text(Localizable.ThirdPaywallScreen.Try.button)
//                            .font(Fonts.Roboto.regular.swiftUIFont(size: 18))
//                            .foregroundStyle(.mainText)
//                            .padding(.horizontal, 40)
//                    }
                }
            }
            
            Spacer()
            
            Image(.saleLettering)
            
            Spacer()
            
            Text(Localizable.ThirdPaywallScreen.GetOptions.button)
                .font(Fonts.Roboto.regular.swiftUIFont(size: 18))
                .foregroundStyle(.cyan)
            
            
            Text(Localizable.ThirdPaywallScreen.OldPrice.button)
                .font(Fonts.Roboto.regular.swiftUIFont(size: 18))
                .foregroundStyle(.mainText)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .strikethrough(true, color: .mainText)
            
            Spacer()
            
            HStack {
                Text(Localizable.ThirdPaywallScreen.Timer.title)
                    .font(Fonts.Roboto.regular.swiftUIFont(size: 15))
                    .foregroundStyle(.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
           
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
    PaywallSaleScreen(
        store: StoreOf<PaywallSale>(
            initialState: PaywallSale.State(),
            reducer: { PaywallSale() }
        )
    )
}




