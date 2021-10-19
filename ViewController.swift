//
//  ViewController.swift
//  Pre_work_Calculator
//
//  Created by James Lee on 10/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var personTotalLabel: UILabel!
    @IBOutlet weak var personCountControl: UISegmentedControl!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func billAmount(_ sender: UITextField) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let personCount = [1, 2, 3, 4]
        let customTip = Double(tipSlider.value * 0.01)
        var tip: Double
        
        tip = bill * customTip
        
        let total = bill + tip
        
        let personTotal = total / Double(personCount[personCountControl.selectedSegmentIndex])
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        personTotalLabel.text = String(format: "$%.2f", personTotal)
    }
    
    @IBAction func slider(_ sender: UISlider) {
        customTipLabel.text = String(format: "%.0f%%", sender.value)
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let personCount = [1, 2, 3, 4]
        let customTip = Double(tipSlider.value * 0.01)
        let tipPercentages = [0.00, 0.15, 0.18, 0.20]
        var tip: Double
        
        if (tipPercentages[tipControl.selectedSegmentIndex] > customTip) {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        }
        else{
            tip = bill * customTip
        }
        let total = bill + tip
        
        let personTotal = total / Double(personCount[personCountControl.selectedSegmentIndex])
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        personTotalLabel.text = String(format: "$%.2f", personTotal)
    }
    @IBAction func resetButtonClicked(sender: UIButton) {
        tipSlider.value = 0.00
        tipControl.selectedSegmentIndex = 0
        personCountControl.selectedSegmentIndex = 0
        billAmountTextField.text = String("")
        tipAmountLabel.text = String("$0.00")
        totalLabel.text = String("$0.00")
        personTotalLabel.text = String("$0.00")
        customTipLabel.text = String("0%")
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let personCount = [1, 2, 3, 4]
        let tipPercentages = [0.00, 0.15, 0.18, 0.20]
        var tip: Double
        
        tipSlider.value = Float(tipPercentages[tipControl.selectedSegmentIndex] * 100)
        
        customTipLabel.text = String(format: "%.0f%%", tipSlider.value)
        
        tip = bill * tipPercentages[tipControl.selectedSegmentIndex]

        let total = bill + tip
        
        let personTotal = total / Double(personCount[personCountControl.selectedSegmentIndex])
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        personTotalLabel.text = String(format: "$%.2f", personTotal)
    }
    
    @IBAction func personCountTip(_ sender: Any){
        let bill = Double(billAmountTextField.text!) ?? 0
        let personCount = [1, 2, 3, 4]
        let tipPercentages = [0.00, 0.15, 0.18, 0.20]
        var tip: Double
        if ((tipPercentages[tipControl.selectedSegmentIndex] * 100) > Double(tipSlider.value)) {
            tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        }
        else{
            tip = bill * (Double(tipSlider.value) * 0.01)
        }
        let total = bill + tip
        
        let personTotal = total / Double(personCount[personCountControl.selectedSegmentIndex])
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        personTotalLabel.text = String(format: "$%.2f", personTotal)
    }

}

