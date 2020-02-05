//
//  DosageView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 13.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct DosageView: View {
    let dosage: Double
    let dosageType: String
    var body: some View {
        HStack{
            Text(String(format: "%.1f", dosage))
                .foregroundColor(.primary)
            Text(dosageType)
                .foregroundColor(.primary)
        }
    }
}

struct DosageView_Previews: PreviewProvider {
    static var previews: some View {
        DosageView(dosage: 1.5, dosageType: "Tablette").previewLayout(.sizeThatFits)
    }
}
