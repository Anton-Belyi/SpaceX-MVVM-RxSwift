//
//  CollectionViewCell.swift
//  MVVM-RxSwift
//
//  Created by Антон Белый on 23.10.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "collectionViewCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
