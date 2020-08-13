//
//  AddressListViewController.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class AddressListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private let layout = UICollectionViewFlowLayout()
    
    private var addresses = [Address]()
    private var selectedTab: Section = .form
    
    var presenter: AddressListPresenterProtocol!
    var configurator: AddressListConfiguratorProtocol = AddressListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        configurator.configure(view: self)
    }
    
    func setupCollectionView() {
        collectionView.registerNib(AddressFormCell.self)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension AddressListViewController: AddressListViewProtocol {
    
    func present(addresses: [Address]) {
        self.selectedTab = .list
        self.addresses = addresses
        collectionView.reloadData()
    }
    
    func presentAddressForm() {
        self.selectedTab = .form
        collectionView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func updateCities() {
        let headerView = collectionView.visibleSupplementaryViews(ofKind: UICollectionView.elementKindSectionHeader).first as? CityListView
        headerView?.presenter.loadCities()
    }
}

extension AddressListViewController: AddressFormCellDelegate {
    
    func didTapSave(city: String?, street: String?, apartment: String?) {
        presenter.save(city: city, street: street, apartment: apartment)
    }
}

extension AddressListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = Section(rawValue: section) else {
            fatalError("Section \(section) is not handled")
        }
        switch sectionType {
        case .list:
            return (selectedTab == .list) ? addresses.count : 0
        case .form:
            return (selectedTab == .form) ? 1 : 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let sectionType = Section(rawValue: indexPath.section) else {
            fatalError("Section \(indexPath.section) is not handled")
        }
        switch sectionType {
        case .list:
            let cell: AddressCell = collectionView.dequeueReusableCell(for: indexPath)
            let address = addresses[indexPath.item]
            cell.configureCell(with: address.fullAddress)
            return cell
        case .form:
            let cell: AddressFormCell = collectionView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard indexPath.section == 0 else { return UICollectionReusableView() }
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "CityListView",
                for: indexPath
            ) as! CityListView
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
}

extension AddressListViewController: UICollectionViewDelegateFlowLayout {
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

extension AddressListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension AddressListViewController {
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
}
