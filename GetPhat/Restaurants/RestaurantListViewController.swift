//
//  RestaurantListViewController.swift
//  GetPhat
//
//  Created by David Nguyen on 25/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet var collectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }


}
