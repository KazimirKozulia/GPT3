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
        var scrollButtons: [ScrollButtons.State] = [ScrollButtons.State(topButtonsText: Text("Tell me a"),  buttonsText: Text("joke")), ScrollButtons.State(topButtonsText: Text("Give me"), buttonsText: Text("recipe")), ScrollButtons.State(topButtonsText: Text("Write a"), buttonsText: Text("code")), ScrollButtons.State(topButtonsText: Text("Write a"),  buttonsText: Text("song")), ScrollButtons.State(topButtonsText: Text("Write me an"),  buttonsText: Text("Email")), ScrollButtons.State(topButtonsText: Text("Summarize"),  buttonsText: Text("text")), ScrollButtons.State(topButtonsText: Text("Write a"),  buttonsText: Text("Poem")), ScrollButtons.State(topButtonsText: Text("Write me an"),  buttonsText: Text("Essay")), ScrollButtons.State(topButtonsText: Text("Science"),  buttonsText: Text("Question"))]
    }
    
    enum Action {
        case settingButtonTapped(SettingButton.Action)
        case scrollButtonsTapped(id: UUID, action: ScrollButtons.Action)
        case onAppear(ScrollButtons.Action)
    }
    
    var body: some ReducerOf<Main> {
        Reduce { state, action in
            switch action {
            case .settingButtonTapped:
                return .none
            case .scrollButtonsTapped:
                return       .none
            case .onAppear:
                return .none
            }
        }
    }
}

struct MainScreen: View {
    let store: StoreOf<Main>
    var body: some View {
        VStack{
            HStack{
                SettingButtonView(store: store.scope(state: \.settingButton, action: \.settingButtonTapped ))
                
                Spacer()
                
                Text("SpeakGenius")
                    .foregroundStyle(.mainText)
                
                Spacer()
                
                Button(action:{
                    
                }, label: {
                    Image(.saleIcon)
                })
                
            } .padding(.horizontal, 20)
            
            Spacer()
            
            Text("Ready prompts")
                .foregroundStyle(.indigo)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(store.state.scrollButtons.indices, id: \.self) { index in
                        ScrollButtonsView(
                            store: store.scope(
                                state: { $0.scrollButtons[index]},
                                action: { .scrollButtonsTapped(id: UUID(), action: $0)}))
                    }
                }                .padding(.horizontal, 20)
                
                
            }
            
            Spacer()
            
            Image(.mainScreenAI)
            
            Spacer()
            
        }  .containerRelativeFrame([.horizontal, .vertical])
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


