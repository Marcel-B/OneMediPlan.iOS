//
//  IntervalInputView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI



struct IntervalInputView: View {
    var intervalTypes = ["Minute(n)", "Stunde(n)", "Tag(e)", "Woche(n)"]
    @EnvironmentObject var intervalInputViewModel: IntervalInputViewModel
    
    var body: some View {
        VStack{
            HStack {
                Text("Jede")
                    .font(.footnote)
                TextField("Interval", text: $intervalInputViewModel.interval).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.decimalPad)
                Picker(selection: $intervalInputViewModel.intervalSelection, label: Text("")) {
                    ForEach(0 ..< intervalTypes.count) {
                        Text(self.intervalTypes[$0])
                    }
                }.fixedSize().frame(maxWidth: 180, maxHeight: 80).clipped()
            }
        }
    }
}

struct IntervalInputView_Previews: PreviewProvider {
    static var previews: some View {
        IntervalInputView().previewLayout(.sizeThatFits).environmentObject(IntervalInputViewModel())
    }
}
