//
//  AddressListInteractorProtocol.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

protocol AddressListInteractorProtocol: class {
    func save(city: String, street: String, apartment: String)
}
