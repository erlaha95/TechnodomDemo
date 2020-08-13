//
//  AppDelegate.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // TODO: remove it
//        UserDefaults.standard.removeObject(forKey: Constants.Common.isFirstLaunch)
//        let realm = try! Realm()
//        try! realm.write {
//            realm.deleteAll()
//        }
        
        return true
    }

}

