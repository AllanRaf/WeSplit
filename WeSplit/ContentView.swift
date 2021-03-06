//
//  ContentView.swift
//  WeSplit
//
//  Created by Allan Man on 14/06/2020.
//  Copyright © 2020 Allan Man. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeople+2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount*tipSelection/100
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal/peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection:$numberOfPeople ){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection:$tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")" )
                }
            }
             .navigationBarTitle("WeSplit")
        }
   
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
