//
//  CoffeeView.swift
//  Testing
//
//  Created by Joshua Tan on 14/5/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//

import SwiftUI
import WebKit

struct Webview: UIViewRepresentable {
    var url: String
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
        
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<Webview>) {
        
    }
    
}

struct CoffeeView: View {
    @State private var selection: String? = nil
    
    var body: some View {
        VStack(spacing: 50) {
            
            
            
                Button("CMCR") {
                self.selection = "CMCR"
                
            }.frame(width: 200.0, height: 100.0)
                .background(Color.white.opacity(0.3))
                .accentColor(.white)
                .font(.largeTitle)
                
                .cornerRadius(15.0)
        
            
            
                
                Button("CafeBond") {
                    self.selection = "CafeBond"
                    
                }.frame(width: 200.0, height: 100.0)
                    .background(Color.white.opacity(0.3))
                    .accentColor(.white)
                    .font(.largeTitle)
                    
                    .cornerRadius(15.0)
            
            NavigationLink(destination: Webview(url: "https://commonmancoffeeroasters.com/collections/filter-coffee"), tag: "CMCR", selection: $selection) {EmptyView() }
            
            NavigationLink(destination: Webview(url: "https://cafebond.com/single-origin?category=5%7C3%7C13&merchants=&price=&intensity=&tasting_notes=&roast_type=Filter"), tag: "CafeBond", selection: $selection) {EmptyView() }
        }
            
            
            .background(Image("bike").blur(radius: 10.0))
        
        
    }
    
}

struct CoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeView()
    }
}
