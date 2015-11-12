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
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var directionsButton: UIButton!
    
    let locationManager = CLLocationManager()
    var collectionOfTees = [MKAnnotation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if MultiPlayer.sharedMultiPlayer.players.isEmpty {
            backButton.hidden = false
            directionsButton.hidden = false
        }

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setupCourseMap()
        
        for i in 0..<rooseveltPark.holes.count {
            let tee = MKPointAnnotation()
            tee.coordinate = rooseveltPark.holes[i].teeLocation
            tee.title = rooseveltPark.holes[i].name
            collectionOfTees.append(tee)
        }
        courseMap.addAnnotations(collectionOfTees)
    }
    
    func setupCourseMap() {
        let parkLocation = CLLocationCoordinate2D(latitude: rooseveltPark.parkLattitude, longitude: rooseveltPark.parkLongitude)
        let span = MKCoordinateSpanMake(0.0035, 0.0035)
        let region = MKCoordinateRegion(center: parkLocation, span: span)
        courseMap.setRegion(region, animated: false)
    }

    @IBAction func getDirectionsButtonPressed(sender: AnyObject) {
        
        let firstTee = MKPlacemark(coordinate: rooseveltPark.holes[0].teeLocation, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: firstTee)
        mapItem.name = "First Tee"
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMapsWithLaunchOptions(launchOptions)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Could not find your location")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0] as CLLocation
    }
}

