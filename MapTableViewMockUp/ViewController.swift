//
//  ViewController.swift
//  MapTableViewMockUp
//
//  Created by john wozniak on 1/3/17.
//  Copyright © 2017 john wozniak. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //register as an observer to recieve notificaiton
        NotificationCenter.default.addObserver(forName: BuildingsController.BUILDING_ADDED_NOTIFICATION, object: nil, queue: nil){ notification in
            let newBuildingPin:MapPin = notification.object as! MapPin
            
            self.mapView.addAnnotation(newBuildingPin)
        }
        
        let buildingsArray:Array = BuildingsController.sharedBuildings()
        for(_,currentObject) in buildingsArray.enumerated(){
            let localBuildingPin:MapPin = currentObject as! MapPin
            mapView.addAnnotation(localBuildingPin)
        }
        
        let distanceSpan: CLLocationDegrees = 2000
        let bsuCSCampusLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.61523924908574, -116.2036558957101)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(bsuCSCampusLocation, distanceSpan, distanceSpan), animated: true)
        
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

