//
//  DetailViewController.swift
//  CollectionView
//
//  Created by mac on 3/14/19.
//  Copyright © 2019 TechnoSales. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var ImageView: UIImageView!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.image = image
        navigationItem.title = "Photo"
    }
}
