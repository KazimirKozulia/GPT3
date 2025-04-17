//
//  LaunchScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 30.03.2025.
//

import SwiftUI
import ComposableArchitecture
import Lottie

@Reducer
struct Launch {
    
    @ObservableState
    struct State {
        
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Launch> {
        Reduce { state, action in
            switch action {
                
            }
        }
        
    }
}

struct LaunchScreen: View {
    var store: StoreOf<Launch>
    
    var body: some View {
        LottieView(animation: .named("GearAnimation"))
            .playing(loopMode: .autoReverse)
            .frame(width: 170, height: 170)
        
            .containerRelativeFrame([.horizontal, .vertical])
            .background(.mainBackground)
    }
}

#Preview {
    LaunchScreen(
        store: StoreOf<Launch>(
            initialState: Launch.State(),
            reducer: { Launch() }
        )
    )
}
