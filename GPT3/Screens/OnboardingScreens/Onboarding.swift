//
//  Onboarding.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 24.01.2025.
//
import SwiftUI
import ComposableArchitecture

enum OnboardingType {
    case first
    case second
    case third
    case fourth
}

@Reducer
struct Onboarding {
    
    @ObservableState
    struct State: Equatable {
        let myType: OnboardingType
        var continueButton : MainButton.State?
        var bottomButtons = BottomButtons.State()
        var backCrossButton = BackCrossButton.State()
        
        var mainTitle:String {
            switch myType {
            case .first:
                "Ask any questions"
            case .second:
                "Please \n Rate the App!"
            case .third:
                "Get Answers \n for Anything"
            case .fourth:
                "Generates content \n within seconds"
            }
        }
        var title:String {
            switch myType {
            case .first:
                "With ChatBot, you can simplify your life by receving quick responses to you inquiries, receving helpful suggestion, and accomplishing a variety of tasks with ease."
            case .second:
                "At all times, we assess your feedback to enhance the quality of our product!"
            case .third:
                "Our AI Language model app can supply answers to a vast array of topics!"
            case .fourth:
                "Capable of generating diverse content, our tool is useful in multiple context and applications."
            }
        }
        var image:UIImage {
            switch myType {
            case .first:
                UIImage(resource: .aiHead)
            case .second:
                UIImage(resource: .manPresentsAPhone)
            case .third:
                UIImage(resource:.startingARobot)
            case .fourth:
                UIImage(resource:.uploadingFiles)
            }
        }
    }
    
    enum Action {
        case buttonTapped(MainButton.Action)
        case bottomButtonsTapped(BottomButtons.Action)
        case backButtonTapped(BackCrossButton.Action)
        case didAppear
    }
    
    var body: some ReducerOf<Onboarding> {
        Reduce { state, action in
            switch action {
            case .buttonTapped(.buttonTapped):
                return .send(.buttonTapped(.updateLoadingState(true)))
            case .buttonTapped:
                return .none
            case .bottomButtonsTapped:
                return .none
            case .backButtonTapped(.buttonTapped):
                return .send(.buttonTapped(.updateLoadingState(false)))
            case .didAppear:
                switch state.myType {
                case . first:
                    state.continueButton = MainButton.State(buttonText: "start")
                case .second, .third:
                    state.continueButton = MainButton.State(buttonText: "continue")
                case .fourth:
                    state.continueButton = MainButton.State(buttonText: "finish")
                }
                return .none
            }
        }
        .ifLet(\.continueButton, action: \.buttonTapped) {
            MainButton()
        }
    }
    
}

struct OnboardingScreens: View {
    let store: StoreOf<Onboarding>
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
                Text(store.mainTitle)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                
                Text(store.title)
                    .foregroundStyle(.mainText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
            }
            Spacer()
            
            Image(uiImage: store.image)

            Spacer()
            
            if let store = store.scope(state: \.continueButton, action: \.buttonTapped) {
                MainButtonView(store: store)
            }
                
            Spacer()
            
            BottomButtonsView(
                store: store.scope(
                    state: \.bottomButtons,
                    action: \.bottomButtonsTapped)
            )
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.mainBackground)
        .onAppear {
            store.send(.didAppear)
        }
    }
}

#Preview {
    OnboardingScreens(
        store: StoreOf<Onboarding>(
            initialState: Onboarding.State(myType: .second),
            reducer: { Onboarding() }
        )
    )
    
}


