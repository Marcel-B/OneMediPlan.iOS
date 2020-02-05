//
//  CreateMediView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 13.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import CoreData

struct CreateMediView: View {
    @State private var selectedDosage = 0
    @State private var showingDetail = false
    @State var fullDissmiss = false
    @State var showInterval = false
    @State var tablette = false
    @State var spritze = false
    @State var saft = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: DosageType.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \DosageType.name, ascending: false)])
    
    var dosageTypes: FetchedResults<DosageType>
    
    @FetchRequest(entity: IntervalType.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \IntervalType.idx, ascending: false)])
     
     var intervalTypes: FetchedResults<IntervalType>
    
    @ObservedObject var nameInputModel = NameInputModel()
    var intervalInputViewModel = IntervalInputViewModel()
    var dosageInputModel = DosageInputModel()
    var stockInputModel = StockInputModel()
    var selectDateInputModel = SelectDateInputModel()
    
    var body: some View {
        ScrollView{
            
            VStack {
                NameInputView()
                    .environmentObject(nameInputModel)
//                    .background(Color.blue)
                
                IntervalInputView()
                    .environmentObject(intervalInputViewModel)
//                    .background(Color.green)
                
                DosageInputView()
                    .environmentObject(dosageInputModel)
//                    .background(Color.yellow)
                
                StockInputView()
                    .environmentObject(stockInputModel)
//                    .background(Color.red)
                
                SelectDateInputView()
                    .environmentObject(selectDateInputModel)
//                    .background(Color.gray)
                
                Button(action: {
                    let medi = Medi(context: self.managedObjectContext)
                    medi.name = self.nameInputModel.name
                    medi.dosage = Double(self.dosageInputModel.dosage) ?? 0
                    medi.stock = Double(self.stockInputModel.stock) ?? 0
                    medi.minimum = Double(self.stockInputModel.minimum) ?? 0
                    medi.dosageType = self.dosageTypes[self.selectedDosage]
                    medi.next = self.selectDateInputModel.date
                    
                    
                    medi.interval = self.intervalInputViewModel.getIntervalInSeconds()
                    let type = self.intervalInputViewModel.getIntervalType()
                    
                    let intType = self.intervalTypes.first { $0.idx == type }
                    
                    medi.intervalType = intType
                    
                    print("All \(medi.interval) seconds")
                    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DosageType")
                    request.returnsObjectsAsFaults = false
                    do {
                        let result = try self.managedObjectContext.fetch(request)
                        for data in result as! [NSManagedObject] {
                            print(data.value(forKey: "name") as! String)
                        }
                    } catch {
                        print(error)
                    }
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                    }) {
                    HStack {
                        Spacer()
                        Text("Speichern")
                    }.padding(.top)
                }
                Spacer()
            }.padding(.horizontal).navigationBarTitle("Neu")
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
                keyWindow!.endEditing(true)
            }
        }
    }
}

struct CreateMediView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMediView()
    }
}
