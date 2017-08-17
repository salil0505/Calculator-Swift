//
//  ViewController.swift
//  Calculator
//
//  Created by Salil Thakur on 8/16/17.
//  Copyright © 2017 Salil Thakur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  private var brain = CalculatorBrain()
  
  private var isUserTyping = false
  
  private var displayValue: Double {
    get {
      return Double(display.text!)!
    }
    set {
      display.text = String(newValue)
    }
  }
  
  @IBOutlet private weak var display: UILabel!
  
  @IBAction private func didTouchDigit(_ sender: UIButton) {
    let digit = sender.currentTitle!
    
    if isUserTyping {
      let currentDisplayValue = display.text!
      display.text = currentDisplayValue + digit
    } else {
      display.text = digit
    }
    
    isUserTyping = true
  }

  @IBAction private func didTapOperationButton(_ sender: UIButton) {
    if isUserTyping {
      brain.setOperand(operand: displayValue)
      isUserTyping = false
    }
    
    if let mathematicalSymbol = sender.currentTitle {
      brain.performOperation(symbol: mathematicalSymbol)
    }
    
    displayValue = brain.result
  }
}

