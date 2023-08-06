//
//  OpenAIApi.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import Foundation
import Alamofire
import Combine

class OpenAIApi {
    let baseUrl = "https://api.openai.com/v1/completions"
//    static let API_KEY = "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"
//    static let API_KEY = "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"
//    static let API_KEY = "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"
 
    
    
    
    func sendMessage(message: String) -> AnyPublisher <OpenAIResponse, Error> {
        let data = OpenAIBody(model: "text-davinci-003", prompt: message, temperature: 0.8, max_tokens: 512)
        let headers: HTTPHeaders = ["Authorization" : "Bearer \(Constants.openAIApiKey)"]
        
        return Future { [weak self] resultation in
            guard let self = self else { return }
            AF.request(self.baseUrl,
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

