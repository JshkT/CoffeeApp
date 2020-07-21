//
//  RecordView.swift
//  CoffeeApp
//
//  Created by Joshua Tan on 17/7/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI
import Foundation

struct RecordView: View {
    var brewRecord: BrewRecord
    
    //Helper to format date in a more readable form.
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    
    var body: some View {
        NavigationLink(destination: BrewDetail(brewRecord: brewRecord)) {
            VStack(alignment: .leading){
                    HStack{
                        Text(brewRecord.brewerType)
                            .font(.headline)
                        Text(brewRecord.grinderType)
                            .font(.caption)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                Text("\(brewRecord.createdAt, formatter: Self.dateFormat)")
                    .font(.caption)
                
                }.frame(maxWidth: .infinity, alignment: .leading)
                
        }
    }
        
}

func formatDate(date: Date) -> String{
    let format = DateFormatter()
    format.timeZone = .current
    print(format.string(from: date))
    
    return format.string(from: date)
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(brewRecord: BrewRecord())
    }
}
