//
//  AddressListInteractorOutputProtocol.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/13/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

protocol AddressListInteractorOutputProtocol: class {
    func didSaveAddress(with result: Result<Void, PersistenceError>)
}

enum PersistenceError: Error {
    case notValid
    
    var localizedDescription: String {
        switch self {
        case .notValid:
            return "Ошибка"
        }
    }
}
