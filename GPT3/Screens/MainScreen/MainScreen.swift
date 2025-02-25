//
//  MainScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 21.01.2025.


import SwiftUI
import ComposableArchitecture

@Reducer
struct Main {
    
    @ObservableState
    struct State: Equatable {
        var settingButton = SettingButton.State()
        var scrollButtons: IdentifiedArrayOf<ScrollButtons.State> = []
    }
    
    enum Action {
        case settingButton(SettingButton.Action)
        case scrollButtons(IdentifiedActionOf<ScrollButtons>)
        case onAppear
    }
    
    var body: some ReducerOf<Main> {
        Reduce { state, action in
            switch action {
            case .settingButton:
                return .none
            case .scrollButtons:
                return .none
            case .onAppear:
                let buttons = [
                    ("Tell me a", "joke"),
                    ("Give me", "recipe"),
                    ("Write a", "code"),
                    ("Write a", "song"),
                    ("Write me an", "Email"),
                    ("Summarize", "text"),
                    ("Write a", "Poem"),
                    ("Write me an", "Essay"),
                    ("Science", "Question")
                ]
                state.scrollButtons = IdentifiedArray(uniqueElements: buttons.map{
                    ScrollButtons.State(id: UUID(), topButtonsText: "\($0.0)", buttonsText: "\($0.1)")
                })
                return .none
            }
        }
        .forEach(\.scrollButtons, action: \.scrollButtons) {
            ScrollButtons()
        }
    }
}

struct MainScreen: View {
    let store: StoreOf<Main>
    var body: some View {
        VStack{
            HStack{
                SettingButtonView(store: store.scope(state: \.settingButton, action: \.settingButton))
                
                Spacer()
                
                Text("SpeakGenius")
                    .foregroundStyle(.mainText)
                
                Spacer()
                
                Button{
                    
                } label: {
                    Image(.saleIcon)
                }
                
            } .padding(.horizontal, 20)
            
            Spacer()
            
            Text("Ready prompts")
                .foregroundStyle(.indigo)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(store.scope(state:\.scrollButtons, action:\.scrollButtons)){ childStore in
                        ScrollButtonsView(store: childStore)
//                            .contentShape(Rectangle())
//                            .allowsHitTesting(true)
                    }
                }              .padding(.horizontal, 20)
                
                
            }
            
            Spacer()
            
            Image(.mainScreenAI)
            
            Spacer()
            
        } .onAppear {
            store.send(.onAppear)
        }
//        .containerRelativeFrame([.horizontal, .vertical])
            .background(.mainBackground)
    }
}

#Preview {
    MainScreen(
        store: StoreOf<Main>(
            initialState: Main.State(),
            reducer: { Main() }
        )
    )
}


