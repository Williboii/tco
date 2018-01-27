//
//  DXiTCOConfig.swift
//  QuantumTCO
//
//  Created by Guillaume Crapart on 22/01/2018.
//  Copyright © 2018 Guillaume Crapart. All rights reserved.
//

import Foundation

struct DXiTCOConfig {
    
    // old Model
    var oldDXiModel: String
    var oldDXiCapacity: String
    var oldDXiConf: String {
        return oldDXiCapacity + " " + oldDXiModel
    }
    var remainingServiceMonths: Int
    var renewalMonthlyPrice: Int
    // var currency: maybe not necessary
    var newServiceRenewal: String
    var newServiceRenewalDiscount: Float // Double?

    
    // new Model
    var newDXiModel: String
    var newDXiCapacity: String
    var newDXiConf: String {
        return newDXiCapacity + " " + newDXiModel
    }
    var supportContractUplift: String
    var hardWareDiscount: Float
    var supportDiscount: Float
    var firstYearPromo: Bool
}
