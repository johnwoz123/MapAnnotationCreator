//
//  TableViewController.swift
//  MapTableViewMockUp
//
//  Created by john wozniak on 1/3/17.
//  Copyright © 2017 john wozniak. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class TableViewController: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: BuildingsController.BUILDING_ADDED_NOTIFICATION, object: nil, queue: nil){ notification in
            //add a table view cell 
            self.tableView.reloadData()
        }
        
        
    }
    
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BuildingsController.sharedBuildings().count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create the cell
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let buildingsArray:NSArray = BuildingsController.sharedBuildings() as NSArray
        let building:MapPin = buildingsArray[indexPath.row] as! MapPin
        cell.textLabel?.text = building.title
        return cell
        
    }
}
