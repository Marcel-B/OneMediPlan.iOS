//
//  SelectDateView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 13.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

class SelectDateInputModel: ObservableObject{
    @Published var date = Date()
}

struct SelectDateInputView: View {
    @EnvironmentObject var model: SelectDateInputModel
    
    var body: some View {
        VStack {
            DatePicker(selection: $model.date, displayedComponents: DatePickerComponents.init([.date, .hourAndMinute])) {
                Text("Start").font(.footnote)
                }.frame(height: 90).clipped()
            Spacer()
        }
    }
}

struct SelectDateInputView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateInputView()
            .previewLayout(.sizeThatFits)
            .environmentObject(SelectDateInputModel())
    }
}
