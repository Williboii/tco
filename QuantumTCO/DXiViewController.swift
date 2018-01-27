//
//  DXiViewController.swift
//  QuantumTCO
//
//  Created by Guillaume Crapart on 19/01/2018.
//  Copyright © 2018 Guillaume Crapart. All rights reserved.
//

import UIKit


class DXiViewController: UIViewController {
    
    
    // MARK: - Set-up Arrays of Configurations for the DXi
    
    let oldConfigs = ["DXi4510", "DXi4520", "DXi4600", "DXi6700-8TBEXP", "DXi6700-16TBEXP", "DXi6800", "DXi8500-1TB", "DXi8500-2TB", "DXi8500-3TB"]
    
    let newConfigs = ["DXi4700", "DXi4700-MP", "DXi6900", "DXi6900-S"]
    
    let oldServiceRenewals = ["Bronze", "NBD Gold", "Gold"]
    
    let newServiceContracts = ["1yr Bze", "1yr NBDG", "1yr Gold", "3yrs Bze", "3yrs NBDG", "3yrs Gold"]
    
    let nrMonths = [Int](1...60)
    
    /*
    let oldConfigsCapacities : [String:[Int]] = ["DXi4510":[4],
                                         "DXi4520":[8],
                                         "DXi4600":[4,8,12],
                                         "DXi6700-8TBEXP":[8,16,24,32,40,48,56,64,72,80],
                                         "DXi6700-16TBEXP": [8,24,40,56,72,80],
                                         "DXi6800": [13,26,39,52,65,78,91,104,117,130,143,156],
                                         "DXi8500-1TB": [20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200],
                                         "DXi8500-2TB": [40,60,80,100,120,140,160,180,200,220,240,260,280,300,320],
                                         "DXi8500-3TB": [45,75,105,135,165,180,210,240,270,300,330]]
    let newConfigsCapacities : [String:[Int]] = ["DXi4700":[5,11,19,27,45,63,81,99,117,135],
                                         "DXi4700-MP":[5,11,19,27,45,63,81,99,117,135],
                                         "DXi6900":[17,34,51,68,85,102,119,136,153,170,187,204,221,238,255,272,289,306,323,340,357,374,391,408,425,442,459,476,493,510],
                                         "DXi6900-S":[34,68,102,136,170,204,238,272,306,340,374,408,442,476,510,544]]

    */
    // let oldCongifsCapacities: Dictionary<String, Array<String>> - below uses Syntactic Sugar
    let oldConfigsCapacities : [String:[String]] = ["DXi4510":["4"],
                                                 "DXi4520":["8"],
                                                 "DXi4600":["4","8","12"],
                                                 "DXi6700-8TBEXP":["8","16","24","32","40","48","56","64","72","80"],
                                                 "DXi6700-16TBEXP": ["8","24","40","56","72","80"],
                                                 "DXi6800": ["13","26","39","52","65","78","91","104","117","130","143","156"],
                                                 "DXi8500-1TB": ["20","30","40","50","60","70","80","90","100","110","120","130","140","150","160","170","180","190","200"],
                                                 "DXi8500-2TB": ["40","60","80","100","120","140","160","180","200","220","240","260","280","300","320"],
                                                 "DXi8500-3TB": ["45","75","105","135","165","180","210","240","270","300","330"]]
    let newConfigsCapacities : [String:[String]] = ["DXi4700":["5","11","19","27","45","63","81","99","117","135"],
                                                 "DXi4700-MP":["5","11","19","27","45","63","81","99","117","135"],
                                                 "DXi6900":["17","34","51","68","85","102","119","136","153","170","187","204","221","238","255","272","289","306","323","340","357","374","391","408","425","442","459","476","493","510"],
                                                 "DXi6900-S":["34","68","102","136","170","204","238","272","306","340","374","408","442","476","510","544"]]
    
    let upliftContracts = ["Gold"]
    
    var selectedOldConfig = "DXi4510"
    var selectedNewConfig = "DXi4700"
    
    var dXiTCOConfig = DXiTCOConfig(oldDXiModel:"Passed from 1",
                                    oldDXiCapacity:"Passed from 1",
                                    remainingServiceMonths: 0,
                                    renewalMonthlyPrice: 0,
                                    newServiceRenewal: "",
                                    newServiceRenewalDiscount: 0.0,
                                    newDXiModel: "Passed from 1",
                                    newDXiCapacity: "Passed from 1",
                                    supportContractUplift: "",
                                    hardWareDiscount: 0.0,
                                    supportDiscount: 0.0,
                                    firstYearPromo: false)
    
    
    // MARK: - pickerView
    var pickerView = UIPickerView()
    var activeTextField = UITextField()
    
    
    // MARK: - Outlets
 
    // currency
    @IBOutlet weak var currencySelector: UISegmentedControl!
    @IBOutlet weak var currencyLabel: UILabel!
    
    // old DXi fields
    @IBOutlet weak var oldDXiModelField: UITextField!
    @IBOutlet weak var oldDXiCapacityField: UITextField!
    @IBOutlet weak var remainingServiceMonthField: UITextField!
    @IBOutlet weak var newServiceRenewalField: UITextField!
    @IBOutlet weak var renewalMonthlyPriceField: UITextField!
    @IBOutlet weak var serviceRenewalDiscountField: UITextField!
    
    // New DXi fields
    @IBOutlet weak var newDXiModelField: UITextField!
    @IBOutlet weak var newDXiCapacityField: UITextField!
    @IBOutlet weak var newSupportContractField: UITextField!
    @IBOutlet weak var newHardwareDiscountField: UITextField!
    @IBOutlet weak var newSupportDiscountField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set picker-managed text fields
        oldDXiModelField.inputView = pickerView
        oldDXiCapacityField.inputView = pickerView
        remainingServiceMonthField.inputView = pickerView
        newServiceRenewalField.inputView = pickerView
        
        newDXiModelField.inputView = pickerView
        newDXiCapacityField.inputView = pickerView
        newSupportContractField.inputView = pickerView
        
        // set up delegate and datasource for picker and text fields
        pickerView.dataSource = self
        pickerView.delegate = self
        oldDXiModelField.delegate = self
        oldDXiCapacityField.delegate = self
        remainingServiceMonthField.delegate = self
        newServiceRenewalField.delegate = self
        newDXiModelField.delegate = self
        newDXiCapacityField.delegate = self
        newSupportContractField.delegate = self
        
        
        // set text field limitations
        renewalMonthlyPriceField.keyboardType = .numberPad
        serviceRenewalDiscountField.keyboardType = .decimalPad
        newHardwareDiscountField.keyboardType = .decimalPad
        newSupportDiscountField.keyboardType = .decimalPad
        
        // disable capacity text fields until a model is selected
        oldDXiCapacityField.isEnabled = false
        newDXiCapacityField.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // test if all text fields have been filled and implement an alert if not the case
        // GC: - Right Implementation ?
        
        /* for case let textField as UITextField in self.view.subviews {
            if textField.text == "" {
                let ac = UIAlertController(title: "Error", message: "Make sure all fields are filled", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in return} ))
                present(ac,animated: true, completion: nil)
                print("one empty field")
                // return
            }
        } */
        let controller = segue.destination as! DXiOutputViewController
        controller.dXiTCOConfig = self.dXiTCOConfig
    }
    
    
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeCurrency(_ sender: Any) {
        currencyLabel.text = currencySelector.titleForSegment(at: currencySelector.selectedSegmentIndex)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension DXiViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    // MARK: - Field Delegate / provides active text field tag
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // prevents the field to be using the wrong pickerview
        activeTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    
    /*
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    */
    
    // MARK: - Picker Delegate Management
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch activeTextField.tag {
        
        case 2:
            return oldConfigsCapacities[selectedOldConfig]!.count //DEBUG
        case 3:
            return nrMonths.count
        case 4:
            return oldServiceRenewals.count
        case 5:
            return newConfigs.count
        case 6:
            return newConfigsCapacities[selectedNewConfig]!.count //DEBUG
        case 7:
            return newServiceContracts.count
        default:
            return oldConfigs.count
        }
    }
    
    // --- Retired non formatted pickers
    /*
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return (oldConfigsCapacities[selectedOldConfig]![row] + " TB") // TO SECURE
        case 2:
            return oldServiceRenewals[row]
        case 3:
            return newConfigs[row]
        case 4:
            return (newConfigsCapacities[selectedNewConfig]![row] + " TB")// TO SECURE
        case 5:
            return newServiceContracts[row]
        default:
            return oldConfigs[row]
        }
    }
   */
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch activeTextField.tag {
        case 2:
            return (oldConfigsCapacities[selectedOldConfig]![row] + " TB") // TO SECURE
        case 3:
            return "\(nrMonths[row])"
        case 4:
            return oldServiceRenewals[row]
        case 5:
            return newConfigs[row]
        case 6:
            return (newConfigsCapacities[selectedNewConfig]![row] + " TB")// TO SECURE
        case 7:
            return newServiceContracts[row]
        default:
            return oldConfigs[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch activeTextField.tag {
        case 2:
            dXiTCOConfig.oldDXiCapacity = oldConfigsCapacities[selectedOldConfig]![row] // TO SECURE
            oldDXiCapacityField.text = oldConfigsCapacities[selectedOldConfig]![row]
            activeTextField.resignFirstResponder()
        case 3:
            dXiTCOConfig.remainingServiceMonths = nrMonths[row]
            remainingServiceMonthField.text = "\(nrMonths[row])"
            activeTextField.resignFirstResponder()
        case 4:
            dXiTCOConfig.newServiceRenewal = oldServiceRenewals[row]
            newServiceRenewalField.text = oldServiceRenewals[row]
            activeTextField.resignFirstResponder()
        case 5:
            dXiTCOConfig.newDXiModel = newConfigs[row]
            selectedNewConfig = newConfigs[row]
            newDXiModelField.text = newConfigs[row]
            // print(newConfigs[row]) // debug
            //newDXiModelPicker.reloadAllComponents()
            //newDXiCapacityPicker.reloadAllComponents()
            if !newDXiCapacityField.isEnabled { newDXiCapacityField.isEnabled = true }
            activeTextField.resignFirstResponder()
        case 6:
            dXiTCOConfig.newDXiCapacity = newConfigsCapacities[selectedNewConfig]![row] // TO SECURE
            newDXiCapacityField.text = newConfigsCapacities[selectedNewConfig]![row]
            activeTextField.resignFirstResponder()
        case 7:
            dXiTCOConfig.supportContractUplift = newServiceContracts[row]
            newSupportContractField.text = newServiceContracts[row]
            activeTextField.resignFirstResponder()
        default:
            dXiTCOConfig.oldDXiModel = oldConfigs[row]
            selectedOldConfig = oldConfigs[row]
            oldDXiModelField.text = oldConfigs[row]
            // print(oldConfigs[row]) // debug
            // print(selectedOldConfig)
            activeTextField.resignFirstResponder()
            //oldDXiModelPicker.reloadAllComponents()
            //oldDXiCapacityPicker.reloadAllComponents()
            if !oldDXiCapacityField.isEnabled { oldDXiCapacityField.isEnabled = true }
        }
    }
    
    
}
