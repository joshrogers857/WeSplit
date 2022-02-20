//
//  ContentView.swift
//  WeSplit
//
//  Created by Joshua Rogers on 20/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(.all)
            
            Text("Some text")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
