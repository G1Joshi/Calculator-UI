//
//  ViewController.swift
//  Calculator Storyboard
//
//  Created by Jeevan Chandra Joshi on 06/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayLabel: UILabel!

    private var calculator = Calculator()
    private var isFinishedTyping = true
    private var displayValue: Double {
        get {
            return Double(displayLabel.text ?? "0") ?? 0
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if let number = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = number
                isFinishedTyping = false
            } else {
                if number == "." && displayLabel.text?.localizedStandardContains(".") == true {
                    return
                }
                displayLabel.text?.append(number)
            }
        }
    }

    @IBAction func modePressed(_ sender: UIButton) {
        isFinishedTyping = true
        calculator.setNumber(displayValue)
        if let mode = sender.currentTitle {
            if let value = calculator.calculate(mode) {
                displayValue = value
            }
        }
    }
}
