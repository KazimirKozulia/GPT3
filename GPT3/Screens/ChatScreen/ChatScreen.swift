//
//  ChatScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 31.01.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Chat {
    
    @ObservableState
    struct State: Equatable {
        var settingButton = SettingButton.State()
        var messages: [Message] = []
        var newMessageText: String = ""
    }
    
    struct Message: Equatable, Identifiable {
        let id = UUID()
        let text: String
        let isSentByCurrentUser: Bool
    }
    
    enum Action {
        case settingButton(SettingButton.Action)
        case newMessageTextChanged(String)
        case sendMessage
        case messageReceived(Message)
    }
    
    var body: some ReducerOf<Chat> {
        Reduce{ state, action in
            switch action {
            case .settingButton:
                return .none
            case let .newMessageTextChanged(text):
                state.newMessageText = text
                return .none
                
            case .sendMessage:
                guard !state.newMessageText.isEmpty else { return .none }
                
                let newMessage = Message(text: state.newMessageText, isSentByCurrentUser: true)
                state.messages.append(newMessage)
                state.newMessageText = ""
                return .none
                
            case let .messageReceived(message):
                state.messages.append(message)
                return .none
            }
        }
    }
}

struct ChatScreen: View {
    let store: StoreOf<Chat>
    var body: some View {
        WithViewStore(self.store, observe: { $0 }){viewStore in
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
                
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(store.state.messages) { message in
                            HStack {
                                if message.isSentByCurrentUser {
                                    Spacer()
                                    Text(message.text)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                } else {
                                    Text(message.text)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(8)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                
                HStack {
                    TextField("Send a message...", text: viewStore.binding(
                        get: \.newMessageText,
                        send: Chat.Action.newMessageTextChanged
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button{
                        store.send(.sendMessage)
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(.blue)
                    }
                    .disabled(store.state.newMessageText.isEmpty)
                }
                .padding()
            }
        }
        
        
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.mainBackground)
    }
}

#Preview {
    ChatScreen(
        store: StoreOf<Chat>(
            initialState: Chat.State(),
            reducer: { Chat() }
        )
    )
}


