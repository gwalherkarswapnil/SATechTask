//
//  QuestionView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI


struct QuestionView: View {
    let question: String
    let options: [String]
    @State private var selectedOption: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.body)
                .padding(.bottom, 5)
            
            HStack {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                    }) {
                        Text(option)
                            .padding()
                            .background(selectedOption == option ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedOption == option ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

//#Preview {
//    QuestionView(question: <#String#>, options: <#[String]#>)
//}
