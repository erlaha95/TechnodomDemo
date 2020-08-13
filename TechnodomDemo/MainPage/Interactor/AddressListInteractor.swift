//
//  AddressListInteractor.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class AddressListInteractor: AddressListInteractorProtocol {
    
    private let service: AddressServiceProtocol
    
    weak var presenter: AddressListInteractorOutputProtocol!
    
    init(service: AddressServiceProtocol = AddressService()) {
        self.service = service
    }
    
    func save(city: String, street: String, apartment: String) {
        service.save(city: city, street: street, apartment: apartment)
        presenter.didSaveAddress(with: .success(()))
    }
}
