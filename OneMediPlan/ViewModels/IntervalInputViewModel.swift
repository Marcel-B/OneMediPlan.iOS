//
//  IntervalInputViewModel.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 04.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

class IntervalInputViewModel: ObservableObject{
    @Published var interval = ""
    @Published var intervalScope = ""
    @Published var intervalSelection = 0
    
    func getIntervalInSeconds() -> Int64 {
        let i = Int64(interval)
        if var inter = i{
            print("\(intervalSelection)")
            switch intervalSelection {
                case 0:
                    inter *= 60 // Minuten
                case 1:
                    inter *= 60 * 60 // Stunden
                case 2:
                    inter *= 60 * 60 * 24 // Tage
                case 3:
                    inter *= 60 * 60 * 24 * 7 // Wochen
                default:
                    inter = 0
            }
            return inter
        }
        return -1
    }
    
    func getIntervalType() -> Int {
        intervalSelection
    }
}
