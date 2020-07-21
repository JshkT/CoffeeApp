//
//  BrewHistoryView.swift
//  CoffeeApp
//
//  Created by Joshua Tan on 17/7/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI
import Foundation


struct BrewHistoryView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: BrewRecord.getAllBrewRecords())
    var brewRecords:FetchedResults<BrewRecord>
    
    var body: some View {
        
        List {
            ForEach(self.brewRecords) { brewRecord in
            
            RecordView(
                brewRecord: brewRecord
            )
            }.onDelete(perform: deleteRecord)
            
        }
            .opacity(0.4)
            .navigationBarTitle("Brew History")
            .background(Color.white.opacity(0.3))
            .accentColor(.white)
            .cornerRadius(15.0)
            .padding(25.0)
            .background(Image("bike").blur(radius: 10.0))
    }
  
    // Needed for .onDelete() to work.
    func deleteRecord(at offsets: IndexSet) {
        for index in offsets {
            let record = brewRecords[index]
            managedObjectContext.delete(record)
        }
    }
}


struct BrewHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BrewHistoryView()
    }
}
