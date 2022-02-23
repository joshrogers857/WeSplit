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
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    private let currencyFormatter: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "GBP")
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        
        return grandTotal / peopleCount
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = chequeAmount / 100 * tipSelection
        
        return chequeAmount + tipValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",
                              value: $chequeAmount,
                              format: currencyFormatter)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip percentage")
                }
                
                Section {
                    Text(grandTotal, format: currencyFormatter)
                } header: {
                     Text("Grand total")
                }
                
                Section {
                    Text(totalPerPerson, format: currencyFormatter)
                } header: {
                     Text("Amount to pay per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}
