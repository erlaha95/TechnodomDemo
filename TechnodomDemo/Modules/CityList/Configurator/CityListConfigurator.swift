//
//  CityListConfigurator.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class CityListConfigurator: CityListConfiguratorProtocol {
    
    func configure(with view: CityListView) {
        let presenter = CityListPresenter(view: view)
        let interactor = CityListInteractor()
        let router = CityListRouter(view: view)
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
