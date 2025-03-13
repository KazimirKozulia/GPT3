//
//  GPTNavigation.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 27.02.2025.
//

import SwiftUI
import ComposableArchitecture

//@Reducer
//struct GPTNavigation {

//    @Reducer(state: .equatable)
//    enum Path {
//        case onboarding(Onboarding)
//        case main(Main)
//    }
//
//    @ObservableState
//    struct State: Equatable {
//        var path = StackState<GPTNavigation.Path>()
//
//        @Shared(.isOnboardingPassed) var isOnboardingPassed = false
//    }
//
//
//
//    enum Action {
//        case navigate(to: Path)
//        case path(StackActionOf<Path>)
//        case setIsOnboardingPassed(Bool)
//    }
//
//    var body: some ReducerOf<Self> {
//        Reduce { state, action in
//            switch action {
//            case let .navigate(screen):
//                state.path.append(screen)
//                return .none
//
//            case let .setIsOnboardingPassed(value):
//                state.isOnboardingPassed = value
//                if value {
//                    state.path.removeAll()
//                    state.path.append(.main)
//                }
//                return .none
//
//            case .path:
//                return .none
//            }
//        }
//    }
//}

@Reducer
struct GPTNavigation {

    @Reducer(state: .equatable)
    enum Path {
        case onboarding(Onboarding)
        case main(Main)
    }

    @ObservableState
    struct State: Equatable {
//        @Shared(.isOnboardingPassed) var isOnboardingPassed = false

        var path = StackState<Path.State>()
        var mainId: StackElementID?
    }

    enum Action {
        case path(StackActionOf<Path>)
    }


    var body: some ReducerOf<GPTNavigation> {
        Reduce { state, action in
            switch action {
//            case .path(.element(_, action: .paywall(.scroll(.close(.close))))),
//                    .path(.element(_ , action: .paywall(.main(.close(.close))))):
//                if let mainId = state.mainId {
//                    state.path.pop(to: mainId)
//                } else {
//                    state.path.append(.main(.init()))
//                    state.mainId = state.path.ids.last
//                }
//                return .none
//            case .path(.element(_, action: .paywall(.offer(.close(.close))))):
//                if state.fromPush {
//                    if let mainId = state.mainId {
//                        state.path.pop(to: mainId)
//                    } else {
//                        state.path.append(.main(.init()))
//                        state.mainId = state.path.ids.last
//                    }
//                } else {
//                    state.path.removeLast()
//                }
//                return .none
            case let .path(.element(id: id, action: .onboarding(.mainButton(.buttonTapped)))):
                guard case let .onboarding(onboarding) = state.path[id: id] else {
                    return .none
                }
                switch onboarding.myType {
                case .first:
                        state.path.append(.onboarding(.init(myType: .first)))
                case .second:
                    state.path.append(.onboarding(.init(myType: .second)))
                case .third:
                    state.path.append(.onboarding(.init(myType: .fourth)))
                case .fourth:
                    state.path.append(.main(.init()))
//                    if state.generalPaywall.isReview {
//                        state.path.append(.onboarding(.init(type: .first)))
//                    } else {
//                        state.path.append(.onboarding(.init(type: .review)))
//                    }
                }
                return .none
                
                
                
//            case .path(.element(_, action: .paywall(.didPurchase))):
//                if let mainId = state.mainId {
//                    state.path.pop(to: mainId)
//                } else {
//                    state.path.append(.main(.init()))
//                    state.mainId = state.path.ids.last
//                }
//                return .none
                
                
                
//            case .path(.element(_, action: .main(.main(.timer(.startButton(.didTap)))))):
//                return pushOfferPaywall(&state)
//            case .path(.element(_, action: .main(.settings(.banner(.upgradeButton(.didTap)))))):
//                return pushOfferPaywall(&state)
//            case .path(.element(_, action: .main(.main(.mainAction(.presented(.timer(.startButton(.didTap)))))))):
//                guard let mainID = state.mainId else { return .none }
//                return .concatenate(
//                    .send(.path(.element(id: mainID, action: .main(.main(.mainAction(.dismiss)))))),
//                    pushOfferPaywall(&state)
//                )
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}

struct GPTNavigationView: View {
    @Bindable var store: StoreOf<GPTNavigation>
    
    var body: some View {
        NavigationStack(
            path: $store.scope(state: \.path, action: \.path)) {
                Text("Loading...")
            } destination: { store in
                switch store.case {
                case let .onboarding(store):
                    Onboarding(store: store)
                        .toolbar(.hidden, for: .navigationBar)
                case let .main(store):
                    MainScreen(store: store)
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    GPTNavigationView(
        store: Store(
            initialState: GPTNavigation.State(),
            reducer: { GPTNavigation() }
        )
    )
}
