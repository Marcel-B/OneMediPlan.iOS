//
//  DosageInputView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
class DosageInputModel: ObservableObject{
    @Published var dosage = ""
    @Published var dosageType = ""
    @Published var dosageSelection = 0
}
struct DosageInputView: View {
    @EnvironmentObject var dosageInputModel: DosageInputModel
    var dosageTypes = ["Tablette(n)", "Spritze(n)", "Saft", "Pulver"]
    
    var body: some View {
        HStack{
            TextField("Anzahl", text: $dosageInputModel.dosage).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.decimalPad)
            Picker(selection: $dosageInputModel.dosageSelection, label: Text("")) {
                ForEach(0 ..< dosageTypes.count) {
                    Text(self.dosageTypes[$0])
                }
            }.fixedSize().frame(maxWidth: 180, maxHeight: 80).clipped()
        }
    }
}

struct DosageInputView_Previews: PreviewProvider {
    static var previews: some View {
        DosageInputView().previewLayout(.sizeThatFits).environmentObject(DosageInputModel())
    }
}
