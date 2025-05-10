//
//  ChatService .swift
//  GPT3
//
//  Created by Kazimir Kozulia on 16.04.2025.
//

import ComposableArchitecture
import OpenAI

struct ChatService {
    
    var sendMessage:(_ messages: [ChatQuery.ChatCompletionMessageParam]) async throws -> String
}

extension DependencyValues {
    var chatService: ChatService {
        get { self[ChatService.self] }
        set { self[ChatService.self] = newValue }
    }
}

extension ChatService: DependencyKey {
    static let liveValue = Self { messages in
        var openAi = OpenAI(apiToken:"")
        let query = ChatQuery(messages: messages, model: .gpt4)
        let result = try await openAi.chats(query: query)
        return result.choices.first?.message.content ?? ""


    }
}

/*
 Массив того что тветил чат и что ответил пользователь
 Все в один общий экран чата 
 */
