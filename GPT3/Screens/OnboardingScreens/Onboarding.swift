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
        var continueButton = MainButton.State(buttonText: "CONTINUE")
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
        case mainButton(MainButton.Action)
        case bottomButtons(BottomButtons.Action)
        case backButton(BackCrossButton.Action)
        case didAppear
    }
    
    
    var body: some ReducerOf<Onboarding> {
        Reduce { state, action in
            switch action {
            case .mainButton:
                return .none
            case .bottomButtons(.termsButtonTapped):
                return .none
            case .bottomButtons(.restoreButtonTapped):
                return .none
            case .backButton:
                return .none
            case .didAppear:
                return .none
            case .bottomButtons(.privacyButtonTapped):
                return .none
            }
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
                        action: \.backButton))
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
            
            MainButtonView(
                store: store.scope(
                    state: \.continueButton,
                    action: \.mainButton)
            )
            
            Spacer()
            
            BottomButtonsView(
                store: store.scope(
                    state: \.bottomButtons,
                    action: \.bottomButtons)
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


