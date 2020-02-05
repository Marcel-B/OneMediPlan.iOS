//
//  MediRowViewModel.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 05.02.20.
//  Copyright © 2020 Marcel Benders. All rights reserved.
//

import Foundation
import SwiftUI

class MediRowViewModel {
    @ObservedObject var medi: Medi
    
    init(_ medi: Medi){
        self.medi = medi
    }
    
    var name: String {
        get {
            if let value = medi.name {
                return value
            }
            return String.empty
        }
    }
    
    var next: Date {
        get {
            if let value = medi.next {
                return value
            }
            return Date()
        }
    }
    
    var last: Date {
        get {
            if let value = medi.last {
                return value
            }
            return Date()
        }
    }
    
    var dosage: Double {
        get {
            medi.dosage
        }
    }
    
    var stock: Double {
        get {
            medi.stock
        }
    }
    
    var minimum: Double {
        get {
            medi.minimum
        }
    }
    
    var dosageType: String {
        get {
            if let value = medi.dosageType {
                if let name = value.name {
                    return name
                }
            }
            return String.empty
        }
    }
}
