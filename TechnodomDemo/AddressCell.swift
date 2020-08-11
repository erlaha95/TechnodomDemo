//
//  AddressCell.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

class AddressCell: UICollectionViewCell {
    @IBOutlet weak var addressLabel: UILabel!
    
    func configureCell(with address: String) {
        addressLabel.text = address
    }
}
