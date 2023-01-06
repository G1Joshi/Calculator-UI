//
//  ViewController.swift
//  Calculator Programmatic
//
//  Created by Jeevan Chandra Joshi on 06/01/23.
//

import UIKit

class ViewController: UIViewController {
    let mainStackView = UIStackView()
    let labelView = UIView()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(mainStackView)

        label.text = "0"
        label.font = .boldSystemFont(ofSize: 50)
        labelView.addSubview(label)

        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.alignment = .fill
        mainStackView.spacing = 1
        mainStackView.addArrangedSubview(labelView)

        setupButtons()
        setupConstraints()
    }

    func setupButtons() {
        var firstNumber = "", secondNumber = "", operation: String?
        let buttons = [
            ["%", "+/-", "AC", "/"],
            ["7", "8", "9", "*"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "+"],
            ["0", "00", ".", "="],
        ]
        for (index, element) in buttons.enumerated() {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = .fill
            stackView.spacing = 1
            for (i, e) in element.enumerated() {
                let button = UIButton()
                button.setTitle(e, for: .normal)
                button.titleLabel?.font = .boldSystemFont(ofSize: 30)
                button.backgroundColor = .systemCyan
                if index == 0 {
                    button.backgroundColor = .systemGray
                }
                if i == 3 {
                    button.backgroundColor = .systemOrange
                }
                let action = UIAction(title: "") { _ in
                    switch e {
                    case "AC":
                        firstNumber = ""
                        secondNumber = ""
                        operation = nil
                        self.label.text = ""
                    case "/", "*", "-", "+", "%":
                        if firstNumber != "" && operation == nil {
                            operation = e
                            self.label.text! += e
                        }
                    case "+/-":
                        if self.label.text?.first == "-" {
                            self.label.text?.removeFirst()
                            firstNumber.removeFirst()
                        } else {
                            self.label.text?.insert("-", at: self.label.text!.startIndex)
                            firstNumber.insert("-", at: firstNumber.startIndex)
                        }
                    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "00", ".":
                        if firstNumber == "" {
                            self.label.text = ""
                        }
                        if operation == nil {
                            if firstNumber.localizedStandardContains(".") && e == "." {
                                break
                            }
                            firstNumber += e
                        } else {
                            if secondNumber.localizedStandardContains(".") && e == "." {
                                break
                            }
                            secondNumber += e
                        }
                        self.label.text! += e
                    case "=":
                        let tempFirstNumber = Float(firstNumber) ?? 0
                        let tempSecondNumber = Float(secondNumber) ?? 0
                        let tempOperation = operation
                        firstNumber = ""
                        secondNumber = ""
                        operation = nil
                        switch tempOperation {
                        case "/":
                            if tempSecondNumber == 0 {
                                self.label.text = "Infinite"
                            } else {
                                self.label.text = String(tempFirstNumber / tempSecondNumber)
                            }
                        case "*": self.label.text = String(tempFirstNumber * tempSecondNumber)
                        case "-": self.label.text = String(tempFirstNumber - tempSecondNumber)
                        case "+": self.label.text = String(tempFirstNumber + tempSecondNumber)
                        case "%": self.label.text = String(Int(tempFirstNumber) % Int(tempSecondNumber))
                        default: break
                        }
                        fallthrough
                    default: firstNumber = self.label.text ?? ""
                    }
                }
                button.addAction(action, for: .touchUpInside)
                stackView.addArrangedSubview(button)
            }
            mainStackView.addArrangedSubview(stackView)
        }
    }

    func setupConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: -10),
        ])
    }
}
