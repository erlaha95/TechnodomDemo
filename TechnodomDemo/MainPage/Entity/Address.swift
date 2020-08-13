//
//  Address.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import RealmSwift

class Address: Object {
    @objc dynamic var street: String
    @objc dynamic var apartment: String
    
    init(street: String, apartment: String) {
        self.street = street
        self.apartment = apartment
    }
    
    required init() {
        self.street = ""
        self.apartment = ""
    }
}

extension Address: AddressRepresentable {
    var fullAddress: String {
        return "\(street)\n\nКв. \(apartment)"
    }
}
