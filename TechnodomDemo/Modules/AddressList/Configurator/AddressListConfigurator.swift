//
//  AddressListConfigurator.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class AddressListConfigurator: AddressListConfiguratorProtocol {
    func configure(view: AddressListViewProtocol) {
        let interactor = AddressListInteractor()
        let presenter = AddressListPresenter(view: view)
        let router = AddressListRouter(view: view)
        
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
}
