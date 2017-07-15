//
//  CrimeReportMapViewController.swift
//  Stay Safe Jamaica
//
//  Created by Jase-Omeileo West on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import UIKit
import MapKit

class CrimeReportMapViewController: UIViewController
{
    @IBOutlet weak var crimeReportMapView: MKMapView?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        crimeReportMapView?.delegate = self
        let coordinate = crimeReportMapView?.centerCoordinate
        
        focus(mapView: crimeReportMapView!, location: coordinate!)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func focus(mapView: MKMapView, location: CLLocationCoordinate2D)
    {
        let latitude = CLLocationDegrees(18.1096)
        let longitude = CLLocationDegrees(-77.2975)
        let latDelta: CLLocationDegrees = 0.3
        let lonDelta: CLLocationDegrees = 0.3
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
    }
}

extension CrimeReportMapViewController: MKMapViewDelegate{}

