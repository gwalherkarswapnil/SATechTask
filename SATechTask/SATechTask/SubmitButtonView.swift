//
//  SubmitButtonView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI

struct SubmitButtonView: View {
    var body: some View {
        Button(action: {
            // Submit action
        }) {
            Text("Submit")
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding()
        }
    }
}

#Preview {
    SubmitButtonView()
}






struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundColor(.blue)
            .padding(.top, 20)
    }
}



