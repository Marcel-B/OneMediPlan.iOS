//
//  NextDateView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 13.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct NextDateView: View {
    let nextDate: Date
   

    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd.MM.yy HH:mm"
        return Text(dateFormatter.string(from: nextDate))
    }
}

struct NextDateView_Previews: PreviewProvider {
    static var previews: some View {
        NextDateView(nextDate: Date()).previewLayout(.sizeThatFits)
    }
}
