//
//  AddressCell.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class AddressCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = Constants.UI.defaultCornerRadius
    }
    
    func configureCell(with address: String) {
        addressLabel.text = address
    }
}
