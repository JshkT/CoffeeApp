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
    
    var body: some View {
        NavigationView {
            VStack( spacing: 80){
                //                Image("tako")
                //                    .renderingMode(.original)
                //                    .resizable()
                //                    .frame(width: 300.0, height: 300.0)
                //                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 9)
                //                    .cornerRadius(/*@START_MENU_TOKEN@*/17.0/*@END_MENU_TOKEN@*/)
                
                
                
                Button("Brew") {
                    self.selection = "Brew"
                    
                }
                .frame(width: 200.0, height: 200.0)
                .background(Color.white.opacity(0.3))
                
                .cornerRadius(15.0)
                .navigationBarTitle("Home")
                .accentColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                
                Button("Coffee") {
                    self.selection = "Coffee"
                }
                .frame(width: 200.0, height: 200.0)
                .background(Color.white.opacity(0.3))
                .accentColor(.white)
                    .font(.largeTitle)

                .cornerRadius(15.0)
                
                
                NavigationLink(destination: BrewView(), tag: "Brew", selection: $selection) {EmptyView() }
                
                NavigationLink(destination: CoffeeView(), tag: "Coffee", selection: $selection) {EmptyView() }
                
                
            }
            .padding(.top, 180.0)
                
            .background(Image("bike").blur(radius: 10.0))
            
        }
        
        
        
        
        
        
        
        
        //            NavigationLink(destination: Text(":O")){
        //                Image("tako")
        //                    .renderingMode(.original)
        //                    .resizable()
        //            }.navigationBarTitle("Yeet")
        //
        //            NavigationLink(destination:
        //            Text("Oho")){
        //                Text("OKOK")
        //            }.navigationBarTitle("Oho?")
        
        //            Text("Hello, World!")
        //                .navigationBarTitle("Navigation", displayMode: .automatic) //Large first then inline subsequently
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
