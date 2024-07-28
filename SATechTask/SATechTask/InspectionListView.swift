//
//  InspectionListView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI

struct InspectionListView: View {
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeaderView(title: "DRUGS")
                        
                        QuestionView(question: "Is the drugs trolley locked?", options: ["Yes", "No", "N/A"])
                        QuestionView(question: "How often is the floor cleaned?", options: ["Everyday", "Every two days", "Every week"])
                        
                        SectionHeaderView(title: "OVERALL IMPRESSIONS")
                        
                        QuestionView(question: "How many staff members are present in the ward?", options: ["1-2", "3-6", "6+", "N/A"])
                    }
                    .padding()
                }
                
                SubmitButtonView()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    InspectionListView()
}

struct Inspection: Identifiable, Codable {
    let id: Int
    let area: Area
    let inspectionType: InspectionType
    let survey: Survey
}
