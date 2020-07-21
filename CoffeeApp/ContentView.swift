//
//  ContentView.swift
//  Testing
//
//  Created by Joshua Tan on 14/5/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var selection: String? = nil
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: BrewRecord.getAllBrewRecords()) var brewRecords:FetchedResults<BrewRecord>
    
    @State private var newBrewRecord = ""
    
    var body: some View {
        NavigationView {
            VStack( spacing: 60){
                Spacer()
                
                Button(action: {
                    self.selection = "Brew"
                }) {
                    Text("Brew")
                        //                .frame(width: 200.0, height: 100.0)
                        .frame(width: UIScreen.main.bounds.width/2,
                               height: UIScreen.main.bounds.height/8)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(15.0)
                        .navigationBarTitle("Home")
                        .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .font(.largeTitle)
                }
                
                Button(action: {
                    self.selection = "History"
                }) {
                    Text("History")
                        .frame(width: UIScreen.main.bounds.width/2,
                               height: UIScreen.main.bounds.height/8)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(15.0)
                        .navigationBarTitle("Home")
                        .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .font(.largeTitle)
                }
                Button(action: {
                    self.selection = "Coffee"
                }) {
                    Text("Coffee")
                        //                .frame(width: 200.0, height: 100.0)
                        .frame(width: UIScreen.main.bounds.width/2,
                               height: UIScreen.main.bounds.height/8)
                        .background(Color.white.opacity(0.3))
                        .accentColor(.white)
                        .font(.largeTitle)
                        .cornerRadius(15.0)
                    
                }
                
                NavigationLink(destination: BrewView(), tag: "Brew", selection: $selection) {EmptyView() }
                NavigationLink(destination: BrewHistoryView(), tag: "History", selection: $selection) {EmptyView() }
                NavigationLink(destination: CoffeeView(), tag: "Coffee", selection: $selection) {EmptyView() }
                
                
            }
            .frame(height: UIScreen.main.bounds.height-20, alignment: .center)
            .padding(.vertical)
            .background(Image("bike").blur(radius: 10.0))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
