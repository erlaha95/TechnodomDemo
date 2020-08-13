//
//  City.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import RealmSwift

class City: Object {
    
    @objc dynamic var name: String
    var addresses = List<Address>()
    
    init(name: String) {
        self.name = name
    }
    
    required init() {
        name = ""
    }
    
    func add(address: Address) {
        addresses.append(address)
    }
}
