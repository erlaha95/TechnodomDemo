//
//  UICollectionView+Extensions.swift
//  TechnodomDemo
//
//  Created by Yerlan Ismailov on 8/12/20.
//  Copyright © 2020 ismailov.kz. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerNib<T: UICollectionViewCell>(_ type: T.Type) {
        let nibName = String(describing: T.self)
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        self.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = String(describing: T.self)
        return dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! T
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, for indexPath: IndexPath) -> T {
        let reuseId = String(describing: T.self)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseId, for: indexPath) as! T
    }
}
