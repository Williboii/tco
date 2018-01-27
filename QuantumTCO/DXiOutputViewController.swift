//
//  DXiOutputViewController.swift
//  QuantumTCO
//
//  Created by Guillaume Crapart on 19/01/2018.
//  Copyright © 2018 Guillaume Crapart. All rights reserved.
//

import UIKit

class DXiOutputViewController: UIViewController {
    
    var dXiTCOConfig = DXiTCOConfig(oldDXiModel:"",
                                    oldDXiCapacity:"",
                                    remainingServiceMonths: 0,
                                    renewalMonthlyPrice: 0,
                                    newServiceRenewal: "",
                                    newServiceRenewalDiscount: 0.0,
                                    newDXiModel: "",
                                    newDXiCapacity: "",
                                    supportContractUplift: "",
                                    hardWareDiscount: 0.0,
                                    supportDiscount: 0.0,
                                    firstYearPromo: false)

    
    @IBOutlet weak var oldConfigurationLabel: UILabel!
    
    @IBOutlet weak var newConfigurationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up view using TCO Configuration Label
        oldConfigurationLabel.text = dXiTCOConfig.oldDXiCapacity + " TB " + dXiTCOConfig.oldDXiModel
        newConfigurationLabel.text = dXiTCOConfig.newDXiCapacity + " TB " + dXiTCOConfig.newDXiModel

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: Any) {
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
