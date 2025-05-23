//
//  ChatScreen.swift
//  GPT3
//
//  Created by Kazimir Kozulia on 31.01.2025.
//

import SwiftUI
import ComposableArchitecture
import OpenAI

@Reducer
struct Chat {
    
    @ObservableState
    struct State: Equatable {
        var settingButton = SettingButton.State()
        @Shared(.chatHistory) var messages: [Message] = []
        var newMessageText: String = ""
        var isLoading = false
        var resivedMessage: [ChatQuery.ChatCompletionMessageParam]
    }
    
    struct Message: Equatable, Identifiable, Codable {
        var id = UUID()
        let text: String
        let isSentByCurrentUser: Bool
        var timestamp: Date = Date()
    }

    enum Action {
        case settingButton(SettingButton.Action)
        case newMessageTextChanged(String)
        case sendMessage
        case messageReceived(String)
        case chatRequestResult(Result<String, Error>)
    }
    
    @Dependency(\.chatService) var chatService
    
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
                guard !state.isLoading else { return .none }
                
                let userMessage = Message(
                    text: state.newMessageText,
                    isSentByCurrentUser: true
                )
//                let newMessage = Message(text: state.newMessageText, isSentByCurrentUser: true)
                state.messages.append(userMessage)
                state.newMessageText = ""
                state.isLoading = true
//                return .none
                return .run { [message = state.messages.last?.text] send in
                    await send(
                        .chatRequestResult(
                            Result{
                                try await chatService.sendMessage(message)
                            }
                        )
                    )
                }
                
            
                
            case let .messageReceived(message):
                let assistantMessage = Message(
                    text: message,
                    isSentByCurrentUser: false
                )
                state.messages.append(assistantMessage)
                return .none
                
            case .chatRequestResult(.success(let string)):
//                state.messageReceived(string) = string
                return .none
                
            case .chatRequestResult(.failure(let error)):
//                state.resivedMessage = error.localizedDescription
                return .none
                
                /*
                 case .chatRequestResult(.success(let response)):
                                // Обрабатываем успешный ответ
                                return .run { send in
                                    await send(.messageReceived(response))
                                }
                                
                            case .chatRequestResult(.failure(let error)):
                                // Обрабатываем ошибку как сообщение
                                let errorMessage = Message(
                                    text: "Ошибка: \(error.localizedDescription)",
                                    isSentByCurrentUser: false
                                )
                                state.messages.append(errorMessage)
                                state.isLoading = false
                                return .none
                 */
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
                    
//                    Text(store.resivedMessage)
                    
                    Text(Localizable.MainScreen.Main.title)
                        .foregroundStyle(.mainText)
                        .font(Fonts.Roboto.regular.swiftUIFont(size: 20))
                    
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
                ZStack(alignment: .trailing){
                    HStack {
                        TextField(Localizable.Chat.Send.Message.Text.field, text: viewStore.binding(
                            get: \.newMessageText,
                            send: Chat.Action.newMessageTextChanged
                        ))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    } .padding()
                    Button{
                        store.send(.sendMessage)
                    } label: {
                        Image(.paperPlane)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal, 20)
                    .disabled(store.state.newMessageText.isEmpty)
                }
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


