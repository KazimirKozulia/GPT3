//
//  MainScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 21.01.2025.


import SwiftUI
import ComposableArchitecture
//import SwiftSyntax

@Reducer
struct Main {
    
    @ObservableState
    struct State: Equatable {
        var settingButton = SettingButton.State()
        var scrollButtons = ScrollButtons.State(topButtonsText: Text("Tell me a"),  buttonsText: Text("joke"))/*: [ScrollButtons.State] = [ScrollButtons.State(topButtonsText: Text("Tell me a"),  buttonsText: Text("joke")), ScrollButtons.State(topButtonsText: Text("Give me"), buttonsText: Text("recipe")), ScrollButtons.State(topButtonsText: Text("Write a"), buttonsText: Text("code"))]*/
    }
    
    enum Action {
        case settingButtonTapped(SettingButton.Action)
        case scrollButtonsTapped(ScrollButtons.Action)
        case onAppear(ScrollButtons.Action)
    }
    
    var body: some ReducerOf<Main> {
        Reduce { state, action in
            switch action {
            case .settingButtonTapped:
                return .none
            case .scrollButtonsTapped(_):
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
                    ScrollButtonsView(store: store.scope(state: \.scrollButtons, action: \.scrollButtonsTapped ))
                    
                    //                    ForEach(store.scrollButtons, id: \.self){ _ in
                    //
                    //                    }
                    //                    ForEach<[ScrollButtons.State], ID, Any>(store.scrollButtons, content: )
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


