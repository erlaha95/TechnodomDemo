//
//  City.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

struct City {
    
    public let name: String
    private var addresses = [Address]()
    
    init(name: String, addresses: [Address] = []) {
        self.name = name
        self.addresses = addresses
    }
    
    mutating func add(address: Address) {
        addresses.append(address)
    }
}
