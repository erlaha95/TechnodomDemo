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
        
        var itemSize: CGSize {
            switch self {
            case .list:
                return CGSize(width: 0.45 * UIScreen.main.bounds.width, height: 100)
            case .form:
                return CGSize(width: 0.9 * UIScreen.main.bounds.width, height: 210)
            }
        }
    }
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    private let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AddressFormCell", bundle: Bundle.main)
        mainCollectionView.register(nib, forCellWithReuseIdentifier: "AddressFormCell")
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 120, height: 120)
        
        mainCollectionView.reloadData()
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
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = Section(rawValue: indexPath.section) else {
            fatalError("Section \(indexPath.section) is not handled")
        }
        switch sectionType {
        case .list:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "AddressCell",
                for: indexPath
            ) as! AddressCell
            return cell
        case .form:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "AddressFormCell",
                for: indexPath
            ) as! AddressFormCell
            return cell
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let sectionType = Section(rawValue: indexPath.section) else {
            fatalError("Section \(indexPath.section) is not handled")
        }
        return sectionType.itemSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}
