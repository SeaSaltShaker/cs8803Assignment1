//
//  LocationViewController.swift
//  GetPhat
//
//  Created by David Nguyen on 26/1/19.
//  Copyright © 2019 David Nguyen. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!

    let manager = LocationDataManager()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        manager.fetch()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = manager.locationItem(at:indexPath)
        
        return cell
    }
    

    
}
