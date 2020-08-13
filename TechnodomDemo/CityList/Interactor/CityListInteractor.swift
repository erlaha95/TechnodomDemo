//
//  CityListInteractor.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class CityListInteractor: CityListInteractorProtocol {
    
    private let service: AddressServiceProtocol
    
    weak var presenter: CityListInteractorOutputProtocol!
    
    init(service: AddressServiceProtocol = AddressService()) {
        self.service = service
    }
    
    func loadAllCities() {
        let cities = service.loadAllCities()
        presenter.didLoad(cities: cities)
    }
    
    func saveAddress(city: String, street: String, apartment: String) {
        service.save(city: city, address: street, apartment: apartment)
    }
}
