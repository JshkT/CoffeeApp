//
//  BrewDetail.swift
//  CoffeeApp
//
//  Created by Joshua Tan on 21/7/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI

struct BrewDetail: View {
    var brewRecord: BrewRecord
    
    //Helper to display date in a more readable form.
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
//        formatter.timeStyle = .short
        return formatter
    }()
    
        //Helper to display time in a more readable form.
        static let timeFormat: DateFormatter = {
            let formatter = DateFormatter()
    //        formatter.dateStyle = .full
            formatter.timeStyle = .short
            return formatter
        }()
    
    var body: some View {
        VStack {
            Text(brewRecord.brewerType)
            Text(brewRecord.grinderType)
            Text("Grind: \(brewRecord.grindRotations), \(brewRecord.grindClicks)")
            Text("Temperature: \(brewRecord.temperature)°C")
            Text("\(brewRecord.createdAt, formatter: Self.timeFormat)")
        }.navigationBarTitle("\(brewRecord.createdAt, formatter: Self.dateFormat)")
    }
}

struct BrewDetail_Previews: PreviewProvider {
    static var previews: some View {
        BrewDetail(brewRecord: BrewRecord.init())
    }
}
