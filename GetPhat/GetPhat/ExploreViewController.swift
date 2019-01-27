//
//  ExploreViewController.swift
//  GetPhat
//
//  Created by David Nguyen on 25/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    let manager = ExploreDataManager()
    var selectedCity:LocationItem?
    var headerView: ExploreHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
}

// MARK: Private Extension
private extension ExploreViewController {
    // code goes here
    func initialize() {
        manager.fetch()
    }
       //Finally, we add this line back as it was removed. We use this function to dismiss our location modal when you hit the Cancel button:
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue){}
    
    //Done button - saves the selection and returns it to the previous screen
    @IBAction func unwindLocationDone(segue:UIStoryboardSegue) {
    if let viewController = segue.source as? LocationViewController {
        selectedCity = viewController.selectedCity
        if let location = selectedCity {
            headerView.lblLocation.text = location.full
            }
        }
    }
}
// MARK: UICollectionViewDataSource
extension ExploreViewController: UICollectionViewDataSource {
    
    //This first method is what we need to add a header to our Collection View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // The identifier is what we added when we were designing in earlier chapters. This identifier helps Xcode know what view we are referring to:
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        headerView = header as? ExploreHeaderView
        return headerView
    }
    
    //Our next method gets called for every item we need. Therefore, in our case, it gets called 20 times
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Here, we are creating a cell every time collectionView(_:numberOfItemsInSection:) is called. The identifier, exploreCell, is the name we gave it in the storyboard; so, this is the cell that is grabbed and used inside of our Collection View
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let item = manager.explore(at: indexPath)
        cell.lblName.text = item.name
        cell.imgExplore.image = UIImage(named: item.image)
        
        return cell
    }
    //This method tells our Collection View how many different sections we want to display:
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //Here, we are telling our Collection View that we only want one section:
        return 1
    }
    
    //Our next method tells our Collection View how many different items we are going to display inside of the section we set up:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        //We are telling our Collection View that we want to display 20 items:
        return manager.numberOfItems()
    }
    
}
