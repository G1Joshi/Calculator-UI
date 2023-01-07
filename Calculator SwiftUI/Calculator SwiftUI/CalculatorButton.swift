//
//  CalculatorButton.swift
//  Calculator SwiftUI
//
//  Created by Jeevan Chandra Joshi on 07/01/23.
//

import SwiftUI

struct CalculatorButton: View {
    var text: String = ""
    var color: Color = Color(.systemCyan)
    var body: some View {
        Button {
        } label: {
            Text(text)
                .font(.largeTitle)
                .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 100, alignment: .center)
                .background(color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
