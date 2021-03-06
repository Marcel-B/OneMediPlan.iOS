//
//  MediListView.swift
//  OneMediPlan
//
//  Created by Marcel Benders on 12.12.19.
//  Copyright © 2019 Marcel Benders. All rights reserved.
//

import SwiftUI
import Combine

struct MediListView: View {
    let viewModel: MediListViewModel
    @State private var showingDetail = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Medi.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Medi.next, ascending: true)])

    var medis: FetchedResults<Medi>
    @State private var showingAlert = false
    @State private var sender = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(medis, id: \.self) { medi in
                    Button(action: {
                        self.sender = medi.name!
                        if self.viewModel.enoughStock(medi){
                            self.viewModel.handleIntoke(medi)
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                        } else {
                            self.showingAlert = true
                        }
                    }){
                        MediRow(viewModel: MediRowViewModel(medi))
                            .padding(.vertical)
                            .foregroundColor(Color.black)
                    }
                }
                .onDelete(perform: delete)
                .listRowBackground(Color("CellColor"))
            }.alert(isPresented: $showingAlert) {
                Alert(title: Text("Attention"), message: Text("Medi '\(self.sender)' is out of stock"), primaryButton: .destructive(Text("Ok")) {
                    print("Medi \(self.sender) clicked")
                    }, secondaryButton: .cancel())
            }
            .navigationBarTitle("One Medi Plan")
                //            .navigationBarItems(trailing: EditButton())
                .navigationBarItems(trailing:
                    NavigationLink(destination: CreateMediView(), label: {
                        Text("Neu")
                    }))
        }
        //            .colorMultiply(Color(red:0.72, green:0.91, blue:0.58))
    }
    
    func delete(at offsets: IndexSet) {
        print(offsets)
        let medi = self.medis[offsets.first!]
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("Unable to read managed object context.")
        }
        
        // TODO - Show Alert window
        context.delete(medi)
    }
}

struct MediListView_Previews: PreviewProvider {
    static var previews: some View {
        MediListView(viewModel: MediListViewModel())
    }
}
