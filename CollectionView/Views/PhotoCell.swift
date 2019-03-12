//
//  PhotoCell.swift
//  CollectionView
//
//  Created by mac on 3/7/19.
//  Copyright © 2019 TechnoSales. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell
{
    
   
    @IBOutlet var photoImageView: UIImageView!
    var imageName: String! {
        didSet{
            photoImageView.image = UIImage(named: imageName)
        }
       
    }
}
