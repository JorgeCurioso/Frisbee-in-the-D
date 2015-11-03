//
//  CourseMapViewController.swift
//  Frisbee-in-the-D
//
//  Created by Jorge on 11/1/15.
//  Copyright © 2015 George Royce. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class CourseMapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var courseMap: MKMapView!
    
    let locationManager = CLLocationManager()
    var collectionOfPins = [MKAnnotation]()
    var collectionOfTees = [MKAnnotation]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        for eachHole in rooseveltPark.holes {
            var tee = MKPointAnnotation()
            tee.coordinate = eachHole.teeLocation
            tee.title = eachHole.name
            collectionOfTees.append(tee)
        }
        courseMap.addAnnotations(collectionOfTees)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let parkLocation = CLLocationCoordinate2D(latitude: rooseveltPark.parkLattitude, longitude: rooseveltPark.parkLongitude)
        let span = MKCoordinateSpanMake(0.0035, 0.0035)
        let region = MKCoordinateRegion(center: parkLocation, span: span)
        courseMap.setRegion(region, animated: false)
    }

    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Could not find your location")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0] as CLLocation
    }
}

