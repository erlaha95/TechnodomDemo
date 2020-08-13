//
//  CityListPresenterProtocol.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/12/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

protocol CityListPresenterProtocol: class {
    
    var router: CityListRouterProtocol! { set get }
    var interactor: CityListInteractorProtocol! { set get }
    
    func loadCities()
    func didSelect(item: CityListView.ItemType)
    
}
