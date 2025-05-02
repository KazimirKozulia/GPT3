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
        @Shared(.isOnboardingPassed) var isOnboardingPassed = false
        let myType: OnboardingType
        var continueButton = MainButton.State(buttonText: Localizable.Continue.Button.text)
        var bottomButtons = BottomButtons.State()
        var backCrossButton = BackCrossButton.State()
        
        var mainTitle:String {
            switch myType {
            case .first:
                Localizable.FirstOnboardingScreen.Main.title
            case .second:
                Localizable.SecondOnboardingScreen.Main.title
            case .third:
                Localizable.ThirdOnboardingScreen.Main.title
            case .fourth:
                Localizable.FourthOnboardingScreen.Main.title
            }
        }
        var title:String {
            switch myType {
            case .first:
                Localizable.FirstOnboardingScreen.subtitle
            case .second:
                Localizable.SecondOnboardingScreen.subtitle
            case .third:
                Localizable.ThirdOnboardingScreen.subtitle
            case .fourth:
                Localizable.FourthOnboardingScreen.subtitle
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
//        case didAppear
    }
    
//    @Dependency(\.openURL) var openURL

    var body: some ReducerOf<Onboarding> {
        Reduce { state, action in
            switch action {
            case .mainButton(.buttonTapped):
                switch state.myType {
                case .first:
                    return .none
                case .second:
                    return .none
                case .third:
                    return .none
                case .fourth:
                    state.$isOnboardingPassed.withLock{
                        $0 = true
                    } 
                    return .none
                }
                //                return .send(.mainButton(.buttonTapped))
            case .bottomButtons(.termsButtonTapped):
                return .none
            case .bottomButtons(.restoreButtonTapped):
                return .none
            case .bottomButtons(.privacyButtonTapped):
                return .none
            case .backButton:
                return .none
//            case .didAppear:
//                return .none
            }
        }
        Scope(state: \.continueButton, action: \.mainButton) {
            MainButton()
        }
        Scope(state: \.bottomButtons, action: \.bottomButtons) {
            BottomButtons()
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
                    .font(Fonts.Roboto.medium.swiftUIFont(size: 35))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.mainText)
                
                Text(store.title)
                    .font(Fonts.Roboto.regular.swiftUIFont(size: 22))
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
//        .onAppear {
//            store.send(.didAppear)
//        }
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


