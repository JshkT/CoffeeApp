//
//  BrewDetail.swift
//  CoffeeApp
//
//  Created by Joshua Tan on 21/7/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI

struct BrewDetail: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    var brewRecord: BrewRecord
    @State var note: String = ""
    
    
    
    //Helper to display date in a more readable form.
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    //Helper to display time in a more readable form.
    static let timeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    var body: some View {
        
        Form {
            Section(header: Text("Brew").font(.title)){
                
                HStack {
                    Text("Brew Method")
                    Spacer()
                    Text(brewRecord.brewerType)
                }
                HStack {
                    Text("Temperature")
                    Spacer()
                    Text("\(brewRecord.temperature)°C")
                }
                
            }
            Section(header: Text("Grind").font(.title)){
                HStack {
                    Text("Grinder")
                    Spacer()
                    Text(brewRecord.grinderType)
                }
                HStack{
                    Text("Settings")
                    Spacer()
                    Text("\(brewRecord.grindRotations), \(brewRecord.grindClicks)")
                }
                
            }
            
            Section(header: Text("About").font(.title)) {
                
                TextField("\(brewRecord.note ?? "Add a Note")", text: $note, onCommit: {
                    self.brewRecord.note = self.note
                    print(self.brewRecord)
                    
                    do {
                        try self.managedObjectContext.save()
                    }catch{
                        print(error)
                    }
                }).keyboardType(.default)
                
                HStack {
                    Text("Created at")
                    Spacer()
                    Text("\(brewRecord.createdAt, formatter: Self.timeFormat)")
                }
            }
//            Button("Submit") {
//
//                self.brewRecord.note = self.note
//                print(self.brewRecord)
//
//                do {
//                    try self.managedObjectContext.save()
//                }catch{
//                    print(error)
//                }
//
//
//            }.frame(maxWidth: .infinity, alignment: .center)
        }
            
        .padding(.vertical)
        .navigationBarTitle(Text("\(brewRecord.createdAt, formatter: Self.dateFormat)"),displayMode: .inline )
        
    }
}

struct BrewDetail_Previews: PreviewProvider {
    static var previews: some View {
        BrewDetail(brewRecord: BrewRecord.init())
    }
}
