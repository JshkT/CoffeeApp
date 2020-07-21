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
    @FetchRequest(fetchRequest: BrewRecord.getAllBrewRecords()) var brewRecords:FetchedResults<BrewRecord>
        
    var body: some View {
        
        List(self.brewRecords) { brewRecord in
            
            RecordView(
            brewRecord: brewRecord
            ).onTapGesture {
                print("tap tap tap")
                
            }
            
        }
        
//        Section(header: Text("Brews").font(.title)) {
//            ForEach(self.brewRecords) {brewRecord in
//
//                RecordView(
//                    brewerType: brewRecord.brewerType,
//                    createdAt: brewRecord.createdAt,
//                    grinderType: brewRecord.grinderType
//                )
//            }
//        }
        .opacity(0.4)
        .navigationBarTitle("Brew History")
        .background(Color.white.opacity(0.3))
        .accentColor(.white)
        .cornerRadius(15.0)
        .padding(25.0)
        .background(Image("bike").blur(radius: 10.0))
    }
    
}

struct BrewHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        BrewHistoryView()
    }
}
