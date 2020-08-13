//
//  AddressService.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import RealmSwift

class AddressService: AddressServiceProtocol {
    
    private let realm: Realm
    
    init() {
        self.realm = try! Realm()
    }
    
    func save(city: String, street: String, apartment: String) {
        if let foundCity = realm.objects(City.self).first(where: { $0.name == city }) {
            let address = Address(street: street, apartment: apartment)
            try! realm.write {
                foundCity.add(address: address)
            }
        } else {
            let city = City(name: city)
            let address = Address(street: street, apartment: apartment)
            city.add(address: address)
            
            try! realm.write {
                realm.add(city)
            }
        }
    }
}
