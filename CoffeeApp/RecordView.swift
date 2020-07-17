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
    var brewerType: String = ""
    var createdAt: Date = Date()
    var grinderType: String = ""
        
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Text(brewerType)
                    .font(.headline)
                Text("\(createdAt)")
                    .font(.caption)
                Text(grinderType)
                    .font(.caption)

            }
            .frame(maxWidth: .infinity, alignment: .center)

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
        RecordView(brewerType: "Testing", createdAt: Date(), grinderType: "EK43")
    }
}
