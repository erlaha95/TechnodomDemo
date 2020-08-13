//
//  CityListView.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/11/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class CityListView: UICollectionReusableView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let layout = UICollectionViewFlowLayout()
    
    var presenter: CityListPresenterProtocol!
    var configurator: CityListConfiguratorProtocol = CityListConfigurator()
    
    private var cities = [City]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionViewLayout()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        configurator.configure(with: self)
        
        presenter.loadCities()
        setAddCellSelected()
    }
    
    private func setAddCellSelected() {
        let indexPath = IndexPath(item: 0, section: Section.add.rawValue)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
    }
    
    private func setupCollectionViewLayout() {
        layout.itemSize = CGSize(width: 115, height: 85)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        collectionView.collectionViewLayout = layout
    }
}

extension CityListView: UICollectionViewDataSource {
    
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
        
        let cell: CityCell = collectionView.dequeueReusableCell(for: indexPath)
        
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

extension CityListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let sectiontype = Section(rawValue: indexPath.section) else {
            fatalError("Section \(indexPath.section) is not handled")
        }
        
        let cell: CityCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.isSelected = true
        
        switch sectiontype {
        case .add:
            presenter.didSelect(item: .add)
        case .cities:
            let city = cities[indexPath.item]
            presenter.didSelect(item: .city(city))
        }
    }
}

extension CityListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let sectiontype = Section(rawValue: indexPath.section) else {
            fatalError("Section \(indexPath.section) is not handled")
        }
        switch sectiontype {
        case .add:
            return CGSize(width: 115, height: collectionView.frame.height)
        case .cities:
            let city = cities[indexPath.item]
            let label = UILabel(frame: .zero)
            label.text = city.name
            label.sizeToFit()
            return CGSize(width: label.frame.width + 40, height: collectionView.frame.height)
        }
    }
}

extension CityListView: CityListViewProtocol {
    func present(cities: [City]) {
        self.cities = cities
        collectionView.reloadData()
    }
}

extension CityListView {
    enum Section: Int, CaseIterable {
        case add
        case cities
    }
    
    enum ItemType {
        case add
        case city(City)
    }
}
