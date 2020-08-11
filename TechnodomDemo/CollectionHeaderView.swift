//
//  CollectionHeaderView.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/11/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    
    enum Section: Int, CaseIterable {
        case add
        case cities
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let layout = UICollectionViewFlowLayout()
    
    private let cities: [City] = {
        let service = AddressGenerator()
        return service.genarateCities(cityCount: 5, addressesPerCityCount: 20)
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layout.itemSize = CGSize(width: 115, height: 85)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        collectionView.collectionViewLayout = layout
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.reloadData()
    }
}

extension CollectionHeaderView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectiontype = Section(rawValue: section) else {
            fatalError("Section \(section) is not handled")
        }
        switch sectiontype {
        case .add:
            return 1
        case .cities:
            return cities.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectiontype = Section(rawValue: indexPath.section) else {
            fatalError("Section \(indexPath.section) is not handled")
        }
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CityCell",
            for: indexPath
        ) as! CityCell
        
        switch sectiontype {
        case .add:
            cell.configure(with: "Добавить")
        case .cities:
            let city = cities[indexPath.item]
            cell.configure(with: city.name)
        }
        
        return cell
    }
}

extension CollectionHeaderView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let city = cities[indexPath.item]
        print("Did select - \(city.name)")
    }
}

extension CollectionHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: collectionView.frame.height)
    }
}
