//
//  CityCell.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/11/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class CityCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = Constants.UI.defaultCornerRadius
    }
    
    func configure(with cityName: String) {
        cityNameLabel.text = cityName
    }
    
}
