//
//  MyData.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 15.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import CoreData

class MyData{
    func getContext() -> NSManagedObjectContext {
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        return context
    }
    
    static let shared = MyData()
    
    func getMedis() -> [Medi]{
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Medi")
        do{
            let results = try context.fetch(fetchRequest)
            
            let medis = results as! [Medi]
            return medis
        }catch{
            print(error)
        }
        return [Medi]()
    }
    
    func getMedi() -> Medi{
        let medis = getMedis()
        return medis[0]
    }
}
