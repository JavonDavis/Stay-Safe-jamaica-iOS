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
    
    var locationManager = CLLocationManager()
    var userRegion: MKCoordinateRegion?
    let crimeReportSegueIdentifier = "showCrimeReportViewController"
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        setup()
    }
    
    func setup()
    {
        // Hide the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setupMapView()
        setupLocation()
    }
    
    func setupMapView()
    {
        crimeReportMapView?.delegate = self
        crimeReportMapView?.showsUserLocation = true
    }

    func setupLocation()
    {
        //check for location services
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.startUpdatingLocation()
        }

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
    
    @IBAction func refreshUserLocation(_ sender: UIButton)
    {
        if let userRegion = userRegion
        {
            crimeReportMapView?.setRegion(userRegion, animated: true)
        }
        else
        {
            showAlert(title: "Oops!", message: "Could not get your location. Please try again later")
        }
        
    }
    
    @IBAction func newCrimeReport(_ sender: UIButton)
    {
        performSegue(withIdentifier: crimeReportSegueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == crimeReportSegueIdentifier {
            let crimeReportVc = segue.destination as! CrimeReportViewController
            let latitude = userRegion?.center.latitude
            let longitude = userRegion?.center.longitude
            
            crimeReportVc.latitude = latitude
            crimeReportVc.longitude = longitude
        }
    }
    
}

extension CrimeReportMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    
}

extension CrimeReportMapViewController: CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last!
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        if userRegion == nil
        {
            userRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            crimeReportMapView?.setRegion(userRegion!, animated: true)
        }
        else
        {
            userRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        }
    }
}
