//
//  InspectionListView.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import SwiftUI

struct WelcomeInspectionListView: View {
    @StateObject private var inspectionService = InspectionNetworkService()
    @State var inspections = [Inspection]()
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeaderView(title: Constants.Questions.drugsSection)
                        if inspections.count > 0 {
                            
                        }
                        QuestionView(question: Constants.Questions.isDrugsTrolleyLocked, options: [Constants.Questions.Options.yes, Constants.Questions.Options.no, Constants.Questions.Options.na])
                        QuestionView(question:Constants.Questions.howOftenIsFloorCleaned, options: [Constants.Questions.Options.everyday, Constants.Questions.Options.everyTwoDays, Constants.Questions.Options.everyWeek])
                        
                        SectionHeaderView(title: Constants.Questions.overallImpressionsSection)
                        
                        QuestionView(question: "How many staff members are present in the ward?", options: ["1-2", "3-6", "6+", "N/A"])
                    }
                    .padding()
                }
                ProgressView()
                    .onAppear {
                        inspectionService.fetchRandomInspection { result in
                            switch result {
                            case .success(let inspection):
                                self.inspections .append(inspection)
                            case .failure(let error) :
                                print(error.localizedDescription)
                            }
                        }
                    }
                
                SubmitButtonView()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    WelcomeInspectionListView()
}

struct Inspection: Identifiable, Codable {
    let id: Int
    let area: Area
    let inspectionType: InspectionType
    let survey: Survey
    
//    init(id: Int, area: Area, inspectionType: InspectionType, survey: Survey) {
//           self.id = id
//           self.area = area
//           self.inspectionType = inspectionType
//           self.survey = survey
//       }
}
