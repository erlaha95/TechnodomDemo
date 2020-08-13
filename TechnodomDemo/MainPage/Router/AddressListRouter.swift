//
//  AddressListRouter.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

class AddressListRouter: AddressListRouterProtocol {
    
    private unowned let view: AddressListViewProtocol
    
    init(view: AddressListViewProtocol) {
        self.view = view
    }
    
}
