////
////  GeneralPaywallScreen.swift
////  GPT3
////
////  Created by Kazimir Kozulia on 02.04.2025.
////
//
//import SwiftUI
//import ComposableArchitecture
//
//@Reducer
//struct GeneralPaywallReducer {
//
//    @ObservableState
//    enum State: Equatable {
//        case introductory(IntroductoryPaywall.State)
//        case fullAccess(PaywallGetFullAccess.State)
//        case sale(PaywallSale.State)
//
////        var isFirstOfferView: Bool {
////            @Shared(.offerPaywall) var offerPaywall = .defaultOffer
////
////            return switch offerPaywall.type {
////            case .offerFirst, .offerFirstReview: true
////            default: false
////            }
////        }
//    }
//
//    enum Action {
//        case introductory(IntroductoryPaywall.Action)
//        case fullAccess(PaywallGetFullAccess.Action)
//        case sale(PaywallSale.Action)
//        case didPurchase
//    }
//
//
//    var body: some ReducerOf<Self> {
//        Reduce { state, action in
//            switch action {
////            case .introductory(.purchaseResult(.success)):
////                return .send(.didPurchase)
////            case .introductory(.offerPaywall(.presented(.didPurchase))):
////                return .send(.didPurchase)
//            case .introductory:
//                return .none
////            case .fullAccess(.purchaseResult(.success)):
////                return .send(.didPurchase)
//            case .fullAccess:
//                return .none
////            case .sale(.purchaseResult(.success)):
////                return .send(.didPurchase)
//            case .sale:
//                return .none
//            case .didPurchase:
//                return .none
//            }
//        }
//        .ifCaseLet(\.introductory, action: \.introductory) {
//            IntroductoryPaywall()
//        }
//        .ifCaseLet(\.fullAccess, action: \.fullAccess) {
//            PaywallGetFullAccess()
//        }
//        .ifCaseLet(\.sale, action: \.sale) {
//            PaywallSale()
//        }
//    }
//}
//
//struct GeneralPaywallView: View {
//    let store: StoreOf<GeneralPaywallReducer>
//
//    var body: some View {
//        WithPerceptionTracking {
//            switch store.state {
//            case .introductory:
//                if let store = store.scope(state: \.introductory, action: \.introductory) {
//                    IntroductoryPaywall(store: store)
//                }
//            case .fullAccess:
//                if let store = store.scope(state: \.fullAccess, action: \.fullAccess) {
//                    PaywallGetFullAccess(store: store)
//                }
//            case .sale:
//                if let store = store.scope(state: \.sale, action: \.sale) {
//                    PaywallSale(store: store)
//                }
//            }
//        }
//    }
//}
