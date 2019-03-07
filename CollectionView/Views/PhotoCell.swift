//
//  PhotoCell.swift
//  CollectionView
//
//  Created by mac on 3/7/19.
//  Copyright © 2019 TechnoSales. All rights reserved.
//

import UIKit

class Photocell: UICollectionViewCell
{
    
    @IBOutlet var photoImageView: UIImageView!
    var imageName: String! {
        didSet
    }
}
