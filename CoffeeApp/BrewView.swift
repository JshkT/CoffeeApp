//
//  BrewView.swift
//  Testing
//
//  Created by Joshua Tan on 14/5/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI

//enum brewerTypes {
//    case V60
//    case Origami
//    case Aeropress
//}


struct BrewView: View {
    @State private var temperature = ""
    @State private var grind = ""
    
    @State private var brewerType = 0
    let brewerTypes = ["V60", "Origami", "Aeropress"]
    
    @State private var grinderType = 0
    let grinderTypes = ["Helor 101", "Hario Skerton", "Commandante C40"]
    
    @State var defaultGrindSetting: [String] = [3, 6].map { "\($0)" }
    
    @State var grinderSettings: [(String, [String])] = [
        ("Rotations", Array(0...6).map { "\($0)" }),
        ("Clicks", Array(0...11).map { "\($0)" }),
    ]
    
    //    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
    
    var body: some View {
        Form {
            //            Text("Brew Settings")
            //                    .frame(maxWidth: .infinity, alignment: .center)
            //                .font(.headline)
            
            Section {
                Text("Brewer")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                Picker("Brewer" ,selection: $brewerType) {
                    ForEach(0 ..< brewerTypes.count) {
                        Text("\(self.brewerTypes[$0])")
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                TextField("Temperature °C", text: $temperature)
                    .keyboardType(.numberPad)
            }.multilineTextAlignment(.center)
            
            Section {
                Text("Grinder")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                Picker("Grinder",selection: $grinderType) {
                    ForEach(0 ..< grinderTypes.count) {
                        Text("\(self.grinderTypes[$0])")
                    }
                }
                Text("Grind Setting").frame(maxWidth: .infinity, alignment: .center)
                HStack(alignment: .center, spacing: 70){
                    Text("Rotations")
                    Text("Clicks")
                }.frame(maxWidth: .infinity, alignment: .center)
                MultiPicker(data: grinderSettings, selection: $defaultGrindSetting).frame(height: 100)

            }.multilineTextAlignment(.center)

        }
        .opacity(0.4)
        .navigationBarTitle("Brew Settings", displayMode: .inline)
        .background(Color.white.opacity(0.3))
        .accentColor(.white)
        .cornerRadius(15.0)
        .padding(25.0)
        .background(Image("bike").blur(radius: 10.0))
        
        
    }
        
    
    
    
}

struct BrewView_Previews: PreviewProvider {
    static var previews: some View {
        BrewView()
    }
}
