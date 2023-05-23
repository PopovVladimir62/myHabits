//
//  CollectionViewCell + ext.swift
//  MyHabits
//
//  Created by Владимир on 15.05.2023.
//

import UIKit

extension UICollectionViewCell {
    enum Metric {
        static let edgeInset: CGFloat = 12
        static let insetBetweenElements: CGFloat = 10
        static let edgeInsetTwenty: CGFloat = 20
    }
    
    static func addShadow(for cell: UICollectionViewCell) {
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 1.0

        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true

        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    }
}
