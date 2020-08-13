//
//  AddressFormCell.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/10/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

protocol AddressFormCellDelegate: class {
    func didTapSave(city: String?, street: String?, apartment: String?)
}

class AddressFormCell: UICollectionViewCell {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var apartmentTextField: UITextField!
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.layer.cornerRadius = Constants.UI.defaultCornerRadius
        }
    }
    
    weak var delegate: AddressFormCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = Constants.UI.defaultCornerRadius
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        delegate?.didTapSave(
            city: cityTextField.text,
            street: addressTextField.text,
            apartment: apartmentTextField.text
        )
    }
    
}
