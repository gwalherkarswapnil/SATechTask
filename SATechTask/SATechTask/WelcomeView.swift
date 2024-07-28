//
//  WelcomeView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject private var viewModel = InspectionViewModel(inspectionService: InspectionNetworkService())
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.largeTitle)
                .padding()
            
            Picker("Select Tab", selection: $selectedTab) {
                Text("Drafts").tag(0)
                Text("Completed").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedTab == 0 {
                InspectionListView()
            } else {
                InspectionListView()
            }
        }
        .alert(isPresented: .constant(viewModel.errorMessage != nil)) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? ""), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    WelcomeView()
}
