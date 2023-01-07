//
//  ContentView.swift
//  Calculator SwiftUI
//
//  Created by Jeevan Chandra Joshi on 07/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            TotalText()
            HStack {
                CalculatorButton(text: "%", color: .gray)
                CalculatorButton(text: "+/-", color: .gray)
                CalculatorButton(text: "AC", color: .gray)
                CalculatorButton(text: "/", color: .orange)
            }
            HStack {
                CalculatorButton(text: "7")
                CalculatorButton(text: "8")
                CalculatorButton(text: "9")
                CalculatorButton(text: "*", color: .orange)
            }
            HStack {
                CalculatorButton(text: "4")
                CalculatorButton(text: "5")
                CalculatorButton(text: "6")
                CalculatorButton(text: "-", color: .orange)
            }
            HStack {
                CalculatorButton(text: "1")
                CalculatorButton(text: "2")
                CalculatorButton(text: "3")
                CalculatorButton(text: "+", color: .orange)
            }
            HStack {
                CalculatorButton(text: "0")
                CalculatorButton(text: "00")
                CalculatorButton(text: ".")
                CalculatorButton(text: "=", color: .orange)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
