//
//  MainViewController.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
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
        
        setupCollectionView()
        mainCollectionView.reloadData()
    }
    
    func setupCollectionView() {
        mainCollectionView.registerNib(AddressFormCell.self)
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 120, height: 120)
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
            let cell: AddressCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        case .form:
            let cell: AddressFormCell = collectionView.dequeueReusableCell(for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard indexPath.section == 0 else { return UICollectionReusableView() }
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "CollectionHeaderView",
                for: indexPath
            ) as! CollectionHeaderView
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
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
        guard section == 0 else { return .zero }
        return CGSize(width: collectionView.frame.width, height: 85)
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
