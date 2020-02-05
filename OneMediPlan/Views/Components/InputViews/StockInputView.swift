//
//  StockInputView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 14.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

class StockInputModel: ObservableObject {
    @Published var stock = ""
    @Published var minimum = ""
}

struct StockInputView: View {
    @EnvironmentObject var model: StockInputModel
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Vorrat")
                    .font(.footnote)
                    .frame(width: 80, alignment: .leading)
//                    .padding(.top)
                
                TextField("Vorrat", text: self.$model.stock){
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            }
            
            HStack {
                Text("Minimum")
                    .font(.footnote)
                    .frame(width: 80, alignment: .leading)
//                    .padding(.top)
                
                TextField("Minimum", text: self.$model.minimum){
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            }
        }
    }
}
struct StockInputView_Previews: PreviewProvider {
    static var previews: some View {
        StockInputView()
            .environmentObject(StockInputModel())
            .previewLayout(.sizeThatFits)
    }
}
