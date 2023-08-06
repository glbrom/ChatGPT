//
//  OpenAI.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endPointUrl = "https://api.openai.com/v1/chat/completions"

    func sendMessage(message: [Message]) async -> OpenAIChatResponse? {
        let openAIMessage = message.map({OpenAIChatMessage(role: $0.role, content: $0.content)})

        let body = OpenAIChatBody(model: "text-davinci-003", message: openAIMessage)
        let headers: HTTPHeaders = ["Authorization" : "Bearer \(Constants.openAIApiKey)"]
        
        return try? await AF.request(endPointUrl, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIChatResponse.self).value
    }
}

struct OpenAIChatBody: Encodable {
    let model: String
    let message: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
   case system
    case user
    case assistant
}

struct OpenAIChatResponse: Decodable {
    let choices: [OpenAIChatChoice]
}

struct OpenAIChatChoice: Decodable {
    let message: OpenAIChatMessage
}

