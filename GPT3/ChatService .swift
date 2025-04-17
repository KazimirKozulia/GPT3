//
//  ChatService .swift
//  GPT3
//
//  Created by Kazimir Kozulia on 16.04.2025.
//

import ComposableArchitecture
import OpenAI

struct ChatService {
    
    var sendMessage:(_ modal: String) async throws -> String
}

extension DependencyValues {
    var chatService: ChatService {
        get { self[ChatService.self] }
        set { self[ChatService.self] = newValue }
    }
}

extension ChatService: DependencyKey {
    static let liveValue = Self { modal in
        var openAi = OpenAI(apiToken:"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")
        let query = ChatQuery(messages: [.user(.init(content: .string(modal))), .assistant(.init(content: ""))], model: .gpt4)
        let result = try await openAi.chats(query: query)
        return result.choices.first?.message.content ?? ""
    }
}

/*
 Массив того что тветил чат и что ответил пользователь
 Все в один общий экран чата 
 */
