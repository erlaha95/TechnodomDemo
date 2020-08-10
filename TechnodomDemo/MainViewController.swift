//
//  MainViewController.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    enum Section: Int {
        case list
        case form
    }
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = Section(rawValue: section) else {
            fatalError("Section \(section) is not handled")
        }
        switch sectionType {
        case .list:
            return 0
        case .form:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
