//
//  InpectionViewModel.swift
//  SATechTask
//
//  Created by Swapnil on 28/07/24.
//

import Foundation
import Combine
class InspectionViewModel: ObservableObject {
    @Published var draftInspections: [Inspection] = []
    @Published var completedInspections: [Inspection] = []
    @Published var errorMessage: String?
    
    private let inspectionService: InspectionService
    
    init(inspectionService: InspectionService) {
        self.inspectionService = inspectionService
        fetchDraftInspections()
        fetchCompletedInspections()
    }
    
    func fetchDraftInspections() {
        inspectionService.fetchDraftInspections { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let inspections):
                    self?.draftInspections = inspections
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func fetchCompletedInspections() {
        inspectionService.fetchCompletedInspections { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let inspections):
                    self?.completedInspections = inspections
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
