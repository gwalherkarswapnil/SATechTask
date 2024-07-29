//
//  Response.swift
//  SATechTask
//
//  Created by Swapnil on 29/07/24.
//

import Foundation
struct InspectionResponse: Codable {
    let inspection: Inspection
}



struct Area: Codable {
    let id: Int
    let name: String
}

struct InspectionType: Codable {
    let id: Int
    let name: String
}

struct Survey: Codable {
    let id: Int
    let categories: [Category]
}

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let questions: [Question]
}

struct Question: Codable {
    let id: Int
    let name: String
    let answerChoices: [AnswerChoice]
    let selectedAnswerChoiceId: Int?
}

struct AnswerChoice: Codable {
    let id: Int
    let name: String
    let score: Double
}
