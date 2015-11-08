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
    var collectionOfTees = [MKAnnotation]()
    var picForTee = MKAnnotationView()
//    var tee = MKPointAnnotation()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
//        courseMap.delegate = self
        
        setupCourseMap()
        
        for eachHole in rooseveltPark.holes {
            let tee = MKPointAnnotation()
            tee.coordinate = eachHole.teeLocation
            tee.title = eachHole.name
//                        if rooseveltPark.currentHoleIndex == 0  {
//                            tee.subtitle = "Current Hole"
//                        }
            collectionOfTees.append(tee)
        }
//        for i in 0..<rooseveltPark.holes.count {
//            picForTee.image = rooseveltPark.holes[i].firstPersonTeeImage
//            tee.coordinate = rooseveltPark.holes[i].teeLocation
//            tee.title = rooseveltPark.holes[i].name
//            if i == 3   {
//                tee.subtitle = "Current Hole"
//            }
//            collectionOfTees.append(tee)
//        }
        courseMap.addAnnotations(collectionOfTees)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCourseMap() {
        let parkLocation = CLLocationCoordinate2D(latitude: rooseveltPark.parkLattitude, longitude: rooseveltPark.parkLongitude)
        let span = MKCoordinateSpanMake(0.0035, 0.0035)
        let region = MKCoordinateRegion(center: parkLocation, span: span)
        courseMap.setRegion(region, animated: false)
    }
    
    
    //Whoa! This shows huge firstPersonTeeImages (hole1) overtop the map. Cool and not cool at the same 
    // time
//    func mapView(mapView: MKMapView!,
//        viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
//            
//            let reuseId = "pin"
//            var teeView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
//            var teeImageView = UIImageView()
//
////            if teeView == nil {
//            for eachHole in rooseveltPark.holes {
//                
//                
//                teeView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//                
//                teeView!.canShowCallout = true
////                teeView!.animatesDrop = true
////                teeView!.image = eachHole.firstPersonTeeImage!
//                teeImageView.image = eachHole.firstPersonTeeImage
//                
//                
//                
////                teeView!.image.layer.setCornerRadius(8.0)
////                teeView!.image.layer.clipsToBounds=true
//    
////
////            }
////            else {
//                teeView!.annotation = annotation
////            }
//            }
//            
//            return teeView
//    }

    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Could not find your location")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations[0] as CLLocation
    }
}

