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
       
        var chatButtons = SettingChatButton.State()
        var bottomButtons = SettingBottomButtons.State()
    }
    
    enum Action {
        case backSettingButtonTapped(BackSettingButton.Action)
  
        case chatButtonsTapped(SettingChatButton.Action)
        case bottomButtonsTapped(SettingBottomButtons.Action)
    }
    
    var body: some ReducerOf<Setting> {
        Reduce { state, action in
            switch action {
            case .backSettingButtonTapped:
                return .none
            case .chatButtonsTapped(_):
                return .none
            case .bottomButtonsTapped(_):
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
                BackSettingButtonView(store: store.scope(state: \.backSettingButton, action: \.backSettingButtonTapped ))
                
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
                        
                        Button(action:{
                        }, label: {     Text("Tap to claim")})
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
            SettingChatButtonView (store: store.scope(state: \.chatButtons, action: \.chatButtonsTapped ))

            Spacer()
            
            SettingBottomButtonsView (store: store.scope(state: \.bottomButtons, action: \.bottomButtonsTapped ))
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


