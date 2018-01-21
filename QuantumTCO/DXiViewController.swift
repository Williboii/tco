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
    

    
    // MARK: - Outlets
    
    @IBOutlet weak var oldDXiModelPicker: UIPickerView!
    @IBOutlet weak var oldDXiCapacityPicker: UIPickerView!
    @IBOutlet weak var oldDXiServiceRenewalPicker: UIPickerView!
    
    
    @IBOutlet weak var newDXiModelPicker: UIPickerView!
    @IBOutlet weak var newDXiCapacityPicker: UIPickerView!
    @IBOutlet weak var newDXiSupportContractPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // delegate & datasource settings
        oldDXiModelPicker.delegate = self
        oldDXiCapacityPicker.delegate = self
        oldDXiServiceRenewalPicker.delegate = self
        newDXiModelPicker.delegate = self
        newDXiCapacityPicker.delegate = self
        newDXiSupportContractPicker.delegate = self
        
        oldDXiModelPicker.dataSource = self
        oldDXiCapacityPicker.dataSource  = self
        oldDXiServiceRenewalPicker.dataSource = self
        newDXiModelPicker.dataSource = self
        newDXiCapacityPicker.dataSource = self
        newDXiSupportContractPicker.dataSource = self
        
        // Additional programmatic settings for Interface
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

extension DXiViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // edit pickers font & colors
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return oldConfigsCapacities[selectedOldConfig]!.count //DEBUG
        case 2:
            return oldServiceRenewals.count
        case 3:
            return newConfigs.count
        case 4:
            return newConfigsCapacities[selectedNewConfig]!.count //DEBUG
        case 5:
            return newServiceContracts.count
        default:
            return oldConfigs.count
        }
    }
    
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
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            return
        case 2:
            return
        case 3:
            selectedNewConfig = newConfigs[row]
            print(newConfigs[row]) // debug
            newDXiModelPicker.reloadAllComponents()
            newDXiCapacityPicker.reloadAllComponents()
        case 4:
            return
        case 5:
            return
        default:
            selectedOldConfig = oldConfigs[row]
            print(oldConfigs[row]) // debug
            oldDXiModelPicker.reloadAllComponents()
            oldDXiCapacityPicker.reloadAllComponents()
        }
    }
    
    
}
