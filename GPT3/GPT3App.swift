//
//  GPT3App.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 18.01.2025.
//

import SwiftUI
import ComposableArchitecture
import FirebaseCore

@main
struct GPT3App: App {
    
        let store = Store(
        initialState: GPTNavigation.State(),
        reducer: { GPTNavigation() }
    )
    
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

//    var body: some Scene {
//        WindowGroup {
//            WithPerceptionTracking {
//                GPTNavigationView(
//                    store: store
//                )
//            }
//            .task {
//                appDelegate.setApp(store)
//            }
//        }
//    }
//}
    
    var body: some Scene {
//        WindowGroup {
//            LaunchScreen(
//                store: StoreOf<Launch>(
//                    initialState:
//                        Launch.State(),
//                    reducer: { Launch() }
//                )
//            )
//        }

        WindowGroup {
            OnboardingScreens(
                store: StoreOf<Onboarding>(
                    initialState:
                        Onboarding
                        .State(myType: .first),
                    reducer: { Onboarding() }
                )
            )
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
