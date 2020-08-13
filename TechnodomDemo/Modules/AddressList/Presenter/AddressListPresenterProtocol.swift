//
//  AddressListPresenterProtocol.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import Foundation

protocol AddressListPresenterProtocol: class {
    
    var router: AddressListRouterProtocol! { set get }
    var interactor: AddressListInteractorProtocol! { set get }
    
    func save(city: String?, street: String?, apartment: String?)
    
}
