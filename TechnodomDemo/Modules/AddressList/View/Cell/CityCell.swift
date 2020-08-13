//
//  CityCell.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/11/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class CityCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = Constants.UI.defaultCornerRadius
            containerView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                addShadow()
            } else {
                removeShadow()
            }
            
            containerView.layer.borderWidth = isSelected ? 1.0 : 0
        }
    }
    
    private func addShadow() {
        containerView.addShadow(offset: CGSize(width: 0, height: 3), color: .red, radius: 3.0, opacity: 0.3)
    }
    
    private func removeShadow() {
        containerView.addShadow(offset: .zero, color: .red, radius: 0, opacity: 0)
    }
    
    func configure(with cityName: String) {
        cityNameLabel.text = cityName
    }
}
