//
//  Constants.swift
//  SATechTask
//
//  Created by Swapnil on 29/07/24.
//

import Foundation
struct Constants {
    struct Login {
        static let title = "Login"
        static let emailPlaceholder = "Email"
        static let passwordPlaceholder = "Password"
        static let loginButton = "Login"
        static let signUpButton = "Sign Up"
    }
    
    
    struct Questions {
        static let drugsSection = "DRUGS"
        static let isDrugsTrolleyLocked = "Is the drugs trolley locked?"
        static let howOftenIsFloorCleaned = "How often is the floor cleaned?"
        static let overallImpressionsSection = "OVERALL IMPRESSIONS"
        static let howManyStaffPresent = "How many staff members are present in the ward?"
        
        struct Options {
            static let yes = "Yes"
            static let no = "No"
            static let na = "N/A"
            static let everyday = "Everyday"
            static let everyTwoDays = "Every two days"
            static let everyWeek = "Every week"
            static let oneToTwo = "1-2"
            static let threeToSix = "3-6"
            static let sixPlus = "6+"
        }
    }
}
