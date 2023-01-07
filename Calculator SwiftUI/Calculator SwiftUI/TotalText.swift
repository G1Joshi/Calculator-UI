//
//  TotalText.swift
//  Calculator SwiftUI
//
//  Created by Jeevan Chandra Joshi on 07/01/23.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        HStack {
            Spacer()
            Text(value)
                .font(.system(size: 60))
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
    }
}
