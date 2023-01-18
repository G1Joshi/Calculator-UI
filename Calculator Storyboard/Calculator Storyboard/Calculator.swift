//
//  Calculator.swift
//  Calculator Storyboard
//
//  Created by Jeevan Chandra Joshi on 18/01/23.
//

struct Calculator {
    private var number: Double?

    private var calculation: (num1: Double, mode: String)?

    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    mutating func calculate(_ mode: String) -> Double? {
        if let num = number {
            if mode == "AC" {
                return 0
            } else if mode == "+/-" {
                return num * -1
            } else if mode == "%" {
                return num * 0.01
            } else if mode == "=" {
                return performCalculation(num2: num)
            } else {
                calculation = (num1: num, mode: mode)
            }
        }
        return nil
    }

    private func performCalculation(num2: Double) -> Double? {
        if let num1 = calculation?.num1, let mode = calculation?.mode {
            switch mode {
            case "÷": return num1 / num2
            case "×": return num1 * num2
            case "+": return num1 + num2
            case "-": return num1 - num2
            default: return nil
            }
        }
        return nil
    }
}
