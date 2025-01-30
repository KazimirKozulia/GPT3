//
//  PaywallFullAccessScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 20.01.2025.
//
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
        case buttonTapped(MainButton.Action)
        case bottomButtonsTapped(BottomButtons.Action)
        case backButtonTapped(BackCrossButton.Action)
    }
    
    var body: some ReducerOf<PaywallFullAccess> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
                return .none
            case .bottomButtonsTapped:
                return .none
            case .backButtonTapped:
                return .none
            }
        }
    }
}

struct PaywallFullAccessScreen: View {
    let store: StoreOf<PaywallFullAccess>
    var body: some View {
        VStack{
            HStack {
                BackCrossButtonView(
                    store: store.scope(
                        state: \.backCrossButton,
                        action: \.backButtonTapped))
                Spacer()
            }
            VStack{
                Text("Ask any questions")
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                
                Text("With ChatBot, you can simplify your life by receving quick responses to you inquiries, receving helpful suggestion, and accomplishing a variety of tasks with ease.")
                    .foregroundStyle(.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
            }
            Spacer()
            
            Image(.aiHead)

            Spacer()
            
            MainButtonView(
                store: store.scope(
                    state: \.continueButton,
                    action: \.buttonTapped)
            )
            
            Spacer()
            
            BottomButtonsView(
                store: store.scope(
                    state: \.bottomButtons,
                    action: \.bottomButtonsTapped)
            )
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

