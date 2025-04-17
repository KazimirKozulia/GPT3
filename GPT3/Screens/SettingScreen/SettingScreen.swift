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
        var newChatButtons = SettingChatButton.State(buttonsText: Localizable.New.Chat.Button.text)
        var chatHistoryButtons = SettingChatButton.State(buttonsText: Localizable.Chat.History.Button.text)
        var termsButton = SettingBottomButtons.State(buttonsText: Localizable.Terms.Of.Use.Button.text)
        var privacyButton = SettingBottomButtons.State(buttonsText: Localizable.Privacy.Policy.Button.text)
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
                
                Text(Localizable.Settings.Back.Button.title)
                    .foregroundStyle(.backButtonSetting)
                    .font(Fonts.Roboto.regular.swiftUIFont(size: 18))
                
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
                        Text(Localizable.Free.Premium.title)
                            .foregroundStyle(.white)
                            .padding(.leading, 30)
                            .font(Fonts.Roboto.light.swiftUIFont(size: 15))
                        
                        Button{
                        } label: { Text(Localizable.Free.Premium.Button.text)}
                            .font(Fonts.Roboto.light.swiftUIFont(size: 16))
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
        }
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


