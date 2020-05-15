//
//  BrewView.swift
//  Testing
//
//  Created by Joshua Tan on 14/5/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI

struct BrewView: View {
    @State private var temperature = ""
    @State private var grind = ""
    
    @State private var brewerType = 0
    let brewerTypes = ["V60", "Origami", "Aeropress"]
    
    @State private var grinderType = 0
    let grinderTypes = ["Helor 101", "Hario Skerton", "Commandante C40"]
    
    var body: some View {
        Form {
            Section {
                
                Picker("Brewer", selection: $brewerType) {
                    ForEach(0 ..< brewerTypes.count) {
                        Text("\(self.brewerTypes[$0])")
                    }
                }
                TextField("Temperature °C", text: $temperature)
                    .keyboardType(.numberPad)
                
                Picker("Grinder", selection: $grinderType) {
                    ForEach(0 ..< grinderTypes.count) {
                        Text("\(self.grinderTypes[$0])")
                    }
                }
                TextField("Grind Setting", text: $grind)
                    .keyboardType(.decimalPad)
                
                
            }
        }.opacity(0.4)
            .navigationBarTitle("Brew Settings", displayMode: .inline)
            .background(Color.white.opacity(0.3))
            .accentColor(.white)
            .cornerRadius(15.0)
            .padding(20.0)
            
            .background(Image("bike").blur(radius: 10.0))
        
        
    }
    
    
    
    
}

struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView()
    }
}
