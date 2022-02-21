//
//  ContentView.swift
//  WeSplit
//
//  Created by Joshua Rogers on 20/02/2022.
//

import SwiftUI

/*
 Contains the main UI for the program
 */

struct ContentView: View {
    @State private var chequeAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",
                              value: $chequeAmount,
                              format: .currency(
                                code: Locale.current.currencyCode ?? "GBP"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Text(chequeAmount, format: .currency(
                                code: Locale.current.currencyCode ?? "GBP"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
