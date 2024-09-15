//
//  OpenAINetworkService.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import Foundation
import Alamofire
import Combine

class OpenAINetworkService {
    func sendMessage(message: String) -> AnyPublisher <OpenAIResponse, Error> {
        let data = OpenAIBody(model: "text-davinci-003", prompt: message, temperature: 0.8, max_tokens: 512)
        let headers: HTTPHeaders = ["Authorization" : "Bearer \(Constants.openAIApiKey)"]
        return Future { [weak self] resultation in
            guard self != nil else { return }
            AF.request(Constants.baseUrl,
                       method: .post,
                       parameters: data,
                       encoder: .json,
                       headers: headers).responseDecodable(of: OpenAIResponse.self) { response in
                switch response.result {
                case .success(let result):
                    resultation(.success(result))
                case .failure(let error):
                    resultation(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}

enum Constants {
    static let openAIApiKey = "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"
    static let baseUrl = "https://api.openai.com/v1/completions"
}

struct OpenAIBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}

struct OpenAIResponse: Decodable {
    let id: String
    let choices: [OpenAIChoice]
}

struct OpenAIChoice: Decodable {
    let text: String
}

struct ChatMessage {
    let id: String
    let content: String
    let sender: MessageSender
    let date: Date
}

enum MessageSender {
    case gpt
    case user
}
