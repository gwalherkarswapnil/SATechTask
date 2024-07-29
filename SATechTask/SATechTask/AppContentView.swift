//
//  ContentView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI

struct AppContentView: View {
    var body: some View {
            NavigationView {
                LoginView()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden()
            }
        }
}

#Preview {
    AppContentView()
}
