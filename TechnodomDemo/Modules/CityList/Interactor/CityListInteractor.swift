//
//  CityListInteractor.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class CityListInteractor: CityListInteractorProtocol {
    
    private let service: CityServiceProtocol
    
    weak var presenter: CityListInteractorOutputProtocol!
    
    init(service: CityServiceProtocol = CityService()) {
        self.service = service
    }
    
    func loadAllCities() {
        let cities = service.loadAllCities()
        presenter.didLoad(cities: cities)
    }
}
