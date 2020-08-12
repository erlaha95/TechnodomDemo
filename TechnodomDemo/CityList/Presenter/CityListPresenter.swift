//
//  CityListPresenter.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/12/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class CityListPresenter: CityListPresenterProtocol {
    
    private unowned let view: CityListViewProtocol
    
    var router: CityListRouterProtocol!
    var interactor: CityListInteractorProtocol!
    
    init(view: CityListViewProtocol) {
        self.view = view
    }
    
    func loadCities() {
    }
    
    
    func didSelect(item: CityListView.ItemType) {
    }
}
