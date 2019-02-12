//
//  SettingsViewController.swift
//  tipCalc
//
//  Created by Yixing Wang on 2/11/19.
//  Copyright © 2019 yxpersonal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var firstP: UITextField!
    @IBOutlet weak var secondP: UITextField!
    @IBOutlet weak var thirdP: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func firstPercentChange(_ sender: Any) {
        let firstPercentage = Double(firstP.text!) ?? 15
        let defaults = UserDefaults.standard
        defaults.set(firstPercentage, forKey: "firstPer")
        defaults.synchronize()
    }
    @IBAction func secondPercentChange(_ sender: Any) {
        let secondPercentage = Double(secondP.text!) ?? 18
        let defaults = UserDefaults.standard
        defaults.set(secondPercentage, forKey: "secondPer")
        defaults.synchronize()
    }
    @IBAction func thirdPercentChange(_ sender: Any) {
        let thirdPercentage = Double(thirdP.text!) ?? 20
        let defaults = UserDefaults.standard
        defaults.set(thirdPercentage, forKey: "thirdPer")
        defaults.synchronize()
    }
    
}
