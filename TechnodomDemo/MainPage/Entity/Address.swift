//
//  Address.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import Foundation

struct Address {
    let street: String
    let house: String
    let apartment: String
}

extension Address: AddressRepresentable {
    var fullAddress: String {
        return "\(street),\n\(house),\n\n\(house)"
    }
}
