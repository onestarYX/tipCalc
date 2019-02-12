//
//  ViewController.swift
//  tipCalc
//
//  Created by Yixing Wang on 2/11/19.
//  Copyright © 2019 yxpersonal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercentage = [0.15, 0.18, 0.2]
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let firstPercentage = defaults.double(forKey: "firstPer")
        let secondPercentage = defaults.double(forKey: "secondPer")
        let thirdPercentage = defaults.double(forKey: "thirdPer")
        tipControl.setTitle("\(firstPercentage)%", forSegmentAt: 0)
        tipControl.setTitle("\(secondPercentage)%", forSegmentAt: 1)
        tipControl.setTitle("\(thirdPercentage)%", forSegmentAt: 2)
        tipPercentage[0] = firstPercentage / 100
        tipPercentage[1] = secondPercentage / 100
        tipPercentage[2] = thirdPercentage / 100
        calculateTip(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        // Calculate the bill and total
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        // Update the bill and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

