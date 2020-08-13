//
//  CityListRouter.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class CityListRouter: CityListRouterProtocol {
    
    private unowned let view: CityListViewProtocol
    
    init(view: CityListViewProtocol) {
        self.view = view
    }
    
    func showAddresses(for city: City) {
    }
    
    func showCreateAddressForm() {
    }
}
