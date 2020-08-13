//
//  CityListInteractorProtocol.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/12/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

protocol CityListInteractorProtocol: class {
    
    var presenter: CityListInteractorOutputProtocol! { get set }
    
    func loadAllCities()
    func saveAddress(city: String, street: String, apartment: String)
}
