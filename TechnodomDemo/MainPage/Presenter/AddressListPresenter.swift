//
//  AddressListPresenter.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import Foundation

class AddressListPresenter: AddressListPresenterProtocol {
    
    private unowned let view: AddressListViewProtocol
    
    var interactor: AddressListInteractorProtocol!
    var router: AddressListRouterProtocol!
    
    init(view: AddressListViewProtocol) {
        self.view = view
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didSelectCity),
            name: .didSelectCity,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didSelectCreateAddress),
            name: .didSelectCreateAddress,
            object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func save(city: String?, street: String?, apartment: String?) {
        guard let city = city, !city.isEmpty else {
            view.showAlert(title: "Заполните все данные", message: "Поле город")
            return
        }
        guard let street = street, !street.isEmpty else {
            view.showAlert(title: "Заполните все данные", message: "Поле адрес")
            return
        }
        guard let apartment = apartment, !apartment.isEmpty else {
            view.showAlert(title: "Заполните все данные", message: "Поле квартира")
            return
        }
        
        interactor.save(city: city, street: street, apartment: apartment)
    }
    
    @objc private func didSelectCity(_ notification: Notification) {
        if let city = notification.object as? City {
            let addresses = city.addresses.sorted(by: {_,_ in true })
            view.present(addresses: addresses)
        }
    }
    
    @objc func didSelectCreateAddress(_ notification: Notification) {
        view.presentAddressForm()
    }
}

extension AddressListPresenter: AddressListInteractorOutputProtocol {
    func didSaveAddress(with result: Result<Void, PersistenceError>) {
        switch result {
        case .success:
            view.showAlert(title: "Ура!", message: "Адрес сохранен")
            view.updateCities()
        case .failure(let error):
            view.showAlert(title: "Ошибка", message: error.localizedDescription)
        }
    }
}
