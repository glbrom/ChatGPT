//
//  InfoView.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI

struct InfoView: View {
    
    @Binding var showDetail: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack(alignment: .center, spacing: 12) {
                    Text("ChatGPT")
                        .font(.custom("DIN Condensed", size: 30))
                        .foregroundColor(Color("MatrixColor")).opacity(0.4)
                        .fontWeight(.light)
                        .padding(.top, 20)
                        .padding(.leading, 140)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showDetail.toggle()
                    }) {
                        Image(systemName: "xmark")
                            .frame(width: 1, height: 1)
                            .font(.system(size: 12))
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.black)
                            .clipShape(Circle())
                            .padding(.trailing, 12)
                    }
                    .padding(.top, 12)
                }
                VStack(alignment: .center, spacing: 8) {
                    Text("Generative Pre-trained Transformer is a chatbot with artificial intelligence, developed by the OpenAI company and capable of working in dialog mode, supporting requests in natural languages. ChatGPT is a large language model, which was trained using methods of training with a teacher and training with reinforcement. This chatbot is based on the second language model from OpenAI — GPT-3.5 — an improved version of the GPT-3 model. On March 14, 2023, the GPT-4 language model was released.")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .font(.footnote)
                        .padding(.horizontal, 16)
                        .frame(width: 340, height: 270)
                        .background(.black).opacity(0.8)
                        .cornerRadius(12)
                    
                }
                .padding(.top, 2)
                Spacer()
            }
            .background(Color("InfoViewColor"))
            .frame(width: 360, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.white.opacity(0.4), lineWidth: 2)
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(showDetail: .constant(true)).preferredColorScheme(.dark)
    }
}

#Preview {
    InfoView(showDetail: .constant(true)).preferredColorScheme(.dark)
}

