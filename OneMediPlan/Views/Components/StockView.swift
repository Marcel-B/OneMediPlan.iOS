//
//  StockView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 13.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct StockView: View {
    let stock: Double
    let minimum: Double
    
    var body: some View {
        HStack{
            Text(String(format: "%.1f", stock))
                .foregroundColor(.primary)
                +
                Text(" / ")
                    .foregroundColor(.primary)
                +
                Text(String(format: "%.1f", minimum))
                    .foregroundColor(.primary)
        }
        .font(.footnote)
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StockView(stock: 2.5, minimum: 1)
                .previewLayout(.sizeThatFits)
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            
            StockView(stock: 2.5, minimum: 1)
                .previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
        }
    }
}
