//
//  File.swift
//  SATechTask
//
//  Created by Swapnil on 29/07/24.
//

import Foundation
import SwiftUI
struct InspectionListView: View {
    @StateObject private var viewModel = InspectionListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        SectionHeaderView(title: Constants.Questions.drugsSection)
                        
                        QuestionView(question: Constants.Questions.isDrugsTrolleyLocked, options: [
                            Constants.Questions.Options.yes,
                            Constants.Questions.Options.no,
                            Constants.Questions.Options.na
                        ])
                        QuestionView(question: Constants.Questions.howOftenIsFloorCleaned, options: [
                            Constants.Questions.Options.everyday,
                            Constants.Questions.Options.everyTwoDays,
                            Constants.Questions.Options.everyWeek
                        ])
                        
                        SectionHeaderView(title: Constants.Questions.overallImpressionsSection)
                        
                        QuestionView(question: Constants.Questions.howManyStaffPresent, options: [
                            Constants.Questions.Options.oneToTwo,
                            Constants.Questions.Options.threeToSix,
                            Constants.Questions.Options.sixPlus,
                            Constants.Questions.Options.na
                        ])
                    }
                    .padding()
                }
                
                SubmitButtonView()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
        }
    }
}

struct InspectionListView_Previews: PreviewProvider {
    static var previews: some View {
        InspectionListView()
    }
}


class InspectionListViewModel: ObservableObject {
    @Published var draftInspections: [Inspection] = []
    @Published var completedInspections: [Inspection] = []
    
    // You can add methods to fetch or update inspections here
}
