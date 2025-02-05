//
//  SettingScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 26.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Setting {
    
    @ObservableState
    struct State: Equatable {
        var backSettingButton = BackSettingButton.State()
        var newChatButtons = SettingChatButton.State(buttonsText: "NEW CHAT")
        var chatHistoryButtons = SettingChatButton.State(buttonsText: "CHAT HISTORY")
        var termsButton = SettingBottomButtons.State(buttonsText: "TERMS OF USE")
        var privacyButton = SettingBottomButtons.State(buttonsText: "PRIVACY POLICY")
    }
    
    enum Action {
        case backSettingButton(BackSettingButton.Action)
  
        case chatButtons(SettingChatButton.Action)
        case bottomButtons(SettingBottomButtons.Action)
    }
    
    var body: some ReducerOf<Setting> {
        Reduce { state, action in
            switch action {
            case .backSettingButton:
                return .none
            case .chatButtons(_):
                return .none
            case .bottomButtons(_):
                return.none
            }
        }
    }
}

struct SettingScreen: View {
    let store: StoreOf<Setting>
    var body: some View {
        VStack{
            HStack{
                BackSettingButtonView(store: store.scope(state: \.backSettingButton, action: \.backSettingButton))
                
                Text("Settings")
                    .foregroundStyle(.backButtonSetting)
                
                Spacer()
                
            } .padding(.horizontal, 20)
                        
            ZStack{
                Canvas { _,_ in }
                    .frame(width: .infinity, height: 110)
                    .background(LinearGradient(gradient: Gradient(colors: [.indigo, .cyan]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                HStack {
                    VStack{
                        Text("You free 3-day \n premium hasn't \n been claimed yet.")
                            .foregroundStyle(.white)
                            .padding(.leading, 30)
                        
                        Button{
                        } label: {     Text("Tap to claim")}
                        .foregroundStyle(.indigo)
                        .background(Color.yellow)
                        .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    Image(.aiHead)
                        .resizable()
                        .padding(.trailing, 20)
                        .frame(width: 170, height: 150)
                }
                
            }
            SettingChatButtonView (store: store.scope(state: \.newChatButtons, action: \.chatButtons ))
            ZStack(alignment: .trailing){
                SettingChatButtonView (store: store.scope(state: \.chatHistoryButtons, action: \.chatButtons ))
                Image(.vector)
                    .padding(.horizontal, 20)
            }
            Spacer()
            
            SettingBottomButtonsView (store: store.scope(state: \.termsButton, action: \.bottomButtons ))
            
            SettingBottomButtonsView (store: store.scope(state: \.privacyButton, action: \.bottomButtons ))
        }  .containerRelativeFrame([.horizontal, .vertical])
            .background(.mainBackground)
    }
}

#Preview {
    SettingScreen(
        store: StoreOf<Setting>(
            initialState: Setting.State(),
            reducer: { Setting() }
        )
    )
}


