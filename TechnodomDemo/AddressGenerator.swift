//
//  AddressGenerator.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import Fakery

struct AddressGenerator {
    
    private let faker: Faker
    
    private var randomCityName: String {
        return faker.address.city()
    }
    
    private var randomStreet: String {
        return faker.address.streetName()
    }
    
    private var buildingNumber: String {
        return faker.address.buildingNumber()
    }
    
    private var apartmentNumber: String {
        return faker.address.buildingNumber()
    }
    
    init(faker: Faker = Faker(locale: "ru")) {
        self.faker = faker
    }
    
    func genarateCities(cityCount: Int, addressesPerCityCount: Int) -> [City] {
        var cities = [City]()
        for _ in 0..<cityCount {
            var addresses = [Address]()
            for _ in 0..<addressesPerCityCount {
                let address = Address(street: randomStreet, house: buildingNumber, apartment: apartmentNumber)
                addresses.append(address)
            }
            let city = City(name: randomCityName, addresses: addresses)
            cities.append(city)
        }
        
        return cities
    }
    
}
