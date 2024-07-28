//
//  HeaderView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//Inspection Details

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Inspection Details")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .background(Color.blue.opacity(0.7))
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.top, 20)
            
            VStack {
                Text("Area: Emergency ICU")
                Text("Inspection Type: Clinical")
            }
            .padding(.top, 8)
        }
        .padding()
    }
}

#Preview {
    HeaderView()
}
