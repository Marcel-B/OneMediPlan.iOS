//
//  MediRow.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 12.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI

struct MediRow: View {
//    @ObservedObject var medi: Medi
    let viewModel: MediRowViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.name)
                    .foregroundColor(.primary)
                    .fontWeight(.thin)
                    .font(.title)
                Spacer()
                DosageView(dosage: viewModel.dosage, dosageType: viewModel.dosageType)
            }
            
            HStack {
                NextDateView(nextDate: viewModel.next)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
                StockView(stock: viewModel.stock, minimum: viewModel.minimum)
            }
            HStack{
                NextDateView(nextDate: viewModel.last)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
            }
        }.padding(.horizontal)
    }
}

struct MediRow_Previews: PreviewProvider {
    static var previews: some View {
        MediRow(viewModel: MediRowViewModel(MyData.shared.getMedi()))
            .previewLayout(.sizeThatFits)
    }
}
