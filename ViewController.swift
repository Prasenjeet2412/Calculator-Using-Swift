//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Prasenjeet Pandagale on 06/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var calculationsLabel: UILabel!
    
    @IBOutlet var resultsLabel: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allClear()
    }
    
    func allClear(){
        workings = ""
        calculationsLabel.text = ""
        resultsLabel.text = ""
    }
    
    func formatResult(result: Double) -> String{
        if (result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0){
                return false
            }
            if (index == workings.count - 1){
                return false
            }
            if (previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter (char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "-"){
            return true
        }
        return false
    }
    
    @IBAction func allClearBtn(_ sender: Any) {
        allClear()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            calculationsLabel.text = workings
        }
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        calculationsLabel.text = workings
    }
    
    @IBAction func percentBtn(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    @IBAction func multiplyBtn(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    
    @IBAction func subtractBtn(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func addBtn(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func resultBtn(_ sender: Any) {
        if validInput(){ let checkWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultsLabel.text = resultString}
        else{
            let alert = UIAlertController(title: "invalid inout", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func dotBtn(_ sender: Any) {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroBtn(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneBtn(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    
    @IBAction func twoBtn(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeBtn(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourBtn(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveBtn(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    
    @IBAction func sixButton(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenBtn(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightBtn(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineBtn(_ sender: Any) {
        addToWorkings(value: "9")
    }
    
    
    
}

