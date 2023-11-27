//
//  ViewController.swift
//  Calculator_Shayaan
//
//  Created by Shayaan Hussain on 26/11/23.
//

import UIKit

class ViewController: UIViewController {

    let operators = ["+", "-", "×", "÷"]
    
    @IBOutlet weak var outputVar: UILabel!
    
    @IBAction func invertNegative(_ sender: UIButton) {
        let sign = Array(outputVar.text!)[0]
        let val = outputVar.text!
        if(sign == "-") {
            let resultVal = val.suffix(val.count - 1)
            outputVar.text = String(resultVal)
        }
        else {
            outputVar.text = "-" + val
        }
    }
    
    @IBAction func clearVal(_ sender: UIButton) {
        outputVar.text = "0"
    }
    
    @IBAction func percentile(_ sender: UIButton) {
        let result = calculate()
        if let finalResult = result as? Double {
            outputVar.text = String(finalResult/100)
        }
    }
    
    @IBAction func button7(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "7"
        }
        else {
            outputVar.text = val + "7"
        }
    }
    
    @IBAction func button8(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "8"
        }
        else {
            outputVar.text = val + "8"
        }
    }
    
    @IBAction func button9(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "9"
        }
        else {
            outputVar.text = val + "9"
        }
    }
    
    @IBAction func button4(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "4"
        }
        else {
            outputVar.text = val + "4"
        }
    }
    
    @IBAction func button5(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "5"
        }
        else {
            outputVar.text = val + "5"
        }
    }
    
    @IBAction func button6(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "6"
        }
        else {
            outputVar.text = val + "6"
        }
    }
    
    @IBAction func button1(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "1"
        }
        else {
            outputVar.text = val + "1"
        }
    }
    
    @IBAction func button2(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "2"
        }
        else {
            outputVar.text = val + "2"
        }
    }
    
    @IBAction func button3(_ sender: UIButton) {
        let val = outputVar.text!
        if(val == "0") {
            outputVar.text = "3"
        }
        else {
            outputVar.text = val + "3"
        }
    }
    
    @IBAction func button0(_ sender: UIButton) {
        let val = outputVar.text!
        if(val != "0") {
            outputVar.text = val + "0"
        }
    }
    
    @IBAction func buttonDot(_ sender: UIButton) {
        let val = outputVar.text!
        if(Array(val)[val.count-1] != ".") {
            outputVar.text = val + "."
        }
        else {
            let resultVal = val.prefix(val.count - 1)
            outputVar.text = String(resultVal)
        }
    }
    
    @IBAction func buttonDivide(_ sender: UIButton) {
        let val = outputVar.text!
        let lastChar = Array(val)[val.count-1]
        if(operators.contains(String(lastChar))) {
            let resultVal = val.prefix(val.count - 1)
            outputVar.text = resultVal + "÷"
        }
        else {
            outputVar.text = val + "÷"
        }
    }
    
    @IBAction func buttonMultiply(_ sender: UIButton) {
        let val = outputVar.text!
        let lastChar = Array(val)[val.count-1]
        if(operators.contains(String(lastChar))) {
            let resultVal = val.prefix(val.count - 1)
            outputVar.text = resultVal + "×"
        }
        else {
            outputVar.text = val + "×"
        }
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        let val = outputVar.text!
        let lastChar = Array(val)[val.count-1]
        if(operators.contains(String(lastChar))) {
            let resultVal = val.prefix(val.count - 1)
            outputVar.text = resultVal + "-"
        }
        else {
            outputVar.text = val + "-"
        }
    }
    
    @IBAction func ButtonPlus(_ sender: UIButton) {
        let val = outputVar.text!
        let lastChar = Array(val)[val.count-1]
        if(operators.contains(String(lastChar))) {
            let resultVal = val.prefix(val.count - 1)
            outputVar.text = resultVal + "+"
        }
        else {
            outputVar.text = val + "+"
        }
    }
    
    @IBAction func buttonCalculate(_ sender: Any) {
        let result = calculate()
        if let finalResult = result as? Double {
            if(finalResult == floor(finalResult)) {
                outputVar.text = String(Int(finalResult))
            } else {
                outputVar.text = String(finalResult)
            }
        }
    }
    
    func calculate() -> Any {
        var expression = outputVar.text!
        if expression.starts(with: "-") {
            expression = "0\(expression)"
        }
        let expArr = Array(expression)
        
        if(operators.contains(String(expArr[expression.count-1])) == false) {
            var result = ""
            var stack = [Character]()
            for char in expression {
                if(operators.contains(String(char))) {
                    if !result.isEmpty && result[result.index(before: result.endIndex)] != " " {
                        result += " "
                    }
                    
                    while let top = stack.last, precedence(top) >= precedence(char) {
                        if !result.isEmpty && result[result.index(before: result.endIndex)] != " " {
                            result += " "
                        }
                        result = "\(result)\(top)"
                        stack.removeLast()
                    }
                    stack.append(char)
                    if !result.isEmpty && result[result.index(before: result.endIndex)] != " " {
                        result += " "
                    }
                } else {
                    result = "\(result)\(char)"
                }
            }
            while let top = stack.last {
                result = "\(result) \(top)"
                stack.removeLast()
            }
            print(result)
            var stackNum = [Double]()
            for elem in result.components(separatedBy: " ") {
                if let number = Double(elem) {
                    stackNum.append(number)
                }
                else {
                    let operand2 = stackNum.popLast()
                    let operand1 = stackNum.popLast()
                    if(elem == "+") {
                        stackNum.append(operand1! + operand2!)
                    }
                    else if(elem == "-") {
                        stackNum.append(operand1! - operand2!)
                    }
                    else if(elem == "×") {
                        stackNum.append(operand1! * operand2!)
                    }
                    else if(elem == "÷") {
                        if operand2 == 0 {
                            return "Invalid"
                        }
                        stackNum.append(operand1! / operand2!)
                    }
                }
            }
            let finalResult = stackNum.popLast()
            return finalResult
        }
        return "No Result"
    }
    
    func precedence(_ oper: Character) -> Int {
        if(oper == "+" || oper == "-") {
            return 1
        } else if (oper == "×" || oper == "÷") {
            return 2
        }
        return 0
    }
    
    @IBOutlet weak var OutputView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let swipeLeft = UISwipeGestureRecognizer()
        let swipeRight = UISwipeGestureRecognizer()
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        
        self.OutputView.addGestureRecognizer(swipeLeft)
        self.OutputView.addGestureRecognizer(swipeRight)
        
        swipeLeft.addTarget(self, action: #selector(swiped(sender: )))
        swipeRight.addTarget(self, action: #selector(swiped(sender: )))
    }
    
    @objc func swiped(sender: UISwipeGestureRecognizer) {
        var result = outputVar.text!
        result.removeLast()
        if result == "0" || result == "" {
            result = "0"
        }
        outputVar.text = result
    }


}

