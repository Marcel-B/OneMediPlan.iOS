//
//  NameInputView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 16.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

class NameInputModel: ObservableObject{
    @Published var name = ""
}

struct NameInputView: View {
    @EnvironmentObject var nameInputModel: NameInputModel
    
    var body: some View {
        HStack {
            Text("Name")
                .font(.footnote)
//                .padding(.top)
            
            TextField("Name", text: self.$nameInputModel.name)
            {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }.textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView().previewLayout(.sizeThatFits).environmentObject(NameInputModel())
    }
}
