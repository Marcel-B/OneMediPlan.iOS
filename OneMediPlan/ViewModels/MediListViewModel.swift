//
//  MediRowViewModel.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 04.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation

class MediListViewModel {
    func handleIntoke(_ medi: Medi) {
        if let name = medi.name{
            print(name)
        }
        else{
            print("No Name")
        }
        if medi.stock - medi.dosage < 0{
            print("not enough medis")
            return
        }
        print("Next intoke in \(medi.interval) seconds")
        if let nextDate = medi.next {
            print("Next Date was \(nextDate)")
            var now = Date()
            now.addTimeInterval(TimeInterval(integerLiteral: medi.interval))
            print("Last Date was \(medi.last!)")
            medi.last = Date()
            medi.next = now
            print("Last Date is \(medi.last!)")
            print("Next Date is \(nextDate)")
        }
        print("Old Stock: \(medi.stock)")
        if medi.stock >= medi.dosage {
            medi.stock -= medi.dosage
        }
        print("New Stock: \(medi.stock)")
        
    }
}
