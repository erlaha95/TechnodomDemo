//
//  AddressListViewProtocol.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

protocol AddressListViewProtocol: class {
    var presenter: AddressListPresenterProtocol! { get set }
    
    func present(addresses: [Address])
    func presentAddressForm()
    func showAlert(title: String, message: String)
    func updateCities()
}
