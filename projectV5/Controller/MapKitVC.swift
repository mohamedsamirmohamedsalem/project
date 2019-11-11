//
//  MapKitVC.swift
//  projectV5
//
//  Created by Mohamed Samir on 11/11/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import UIKit
import MapKit // for dealing with MapKit view
import CoreLocation // for getting any location

class MapKitVC: UIViewController {

    // MARK :- Instances
    let location : String? = "30.805081,30.995290"
    // that object will dealing with location
    var locationManager = CLLocationManager()
    // for permit or not permit app to be authorized from the user
    let authorizationStatus = CLLocationManager.authorizationStatus()
    // the normal radious for the view of map
    let regionRadius : CLLocationDistance = 1000
    // default coordibate that will appear if location camed from API is bot available (Not Found) and will set in else status of fixLocationFuncation
    var defaultCoordinate = CLLocationCoordinate2D()
    
    // MARK :- IBOutlets
    @IBOutlet var MapKit: MKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        ///////////coreLocation/////////////
        locationManager.delegate = self
        // AccuracyHundredMeters for good battery performance
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        // allow locationManager to get locations and work in the background
        // cause app to error so i commented it
       //  locationManager.allowsBackgroundLocationUpdates = true
        fixLocation()
        configureLocationServices()
        //////////////MapKit//////////////////
        centerMapOnMyLocation()
        addCustomPlaceAnnotation()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for appling this you must inherit from MKMapViewDelegate protocol
        MapKit.delegate = self
    }
    
    
    // MARK :- IBActions
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        centerMapOnMyLocation()
    }
    @IBAction func distenationButtonPressed(_ sender: UIButton) {
        centerMapOnCenterLocation()
    }
    @IBAction func goToDistination(_ sender: UIButton) {
        makeADirection()
    }
    @IBAction func mapTypeSegmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            MapKit.mapType = .standard
        }else if sender.selectedSegmentIndex == 1 {
            MapKit.mapType = .satellite
        }else {
            MapKit.mapType = .hybrid
        }
    }
    
}

extension MapKitVC : MKMapViewDelegate {
    
    func centerMapOnMyLocation(){
        
        guard let myLocation = locationManager.location?.coordinate else { return }
        let coordinateRegion = MKCoordinateRegion(center: myLocation, latitudinalMeters: regionRadius , longitudinalMeters: regionRadius )
        MapKit.setRegion(coordinateRegion, animated: true)
    }
    
    func centerMapOnCenterLocation(){
        
        let coordinateRegion = MKCoordinateRegion(center: defaultCoordinate, latitudinalMeters: regionRadius , longitudinalMeters: regionRadius )
        MapKit.setRegion(coordinateRegion, animated: true)
    }
    
    // responsiple for drawing a pin on my selected location in map
    func addCustomPlaceAnnotation()  {
        
        // this string data are the data which appear when pres on Annotation on map
        let annotation = DroppablePin(coordinate: defaultCoordinate, identifire: "Custom", subtitle: " \(NSLocalizedString("there is Our Branch in", comment: "our branche location")) \("branch.name")  ", title: "\(NSLocalizedString("New Concept Center", comment: "our branch"))")
        
        MapKit.addAnnotation(annotation)
    }
    
}
//////////////////////////////////////////////////////////////
extension MapKitVC : CLLocationManagerDelegate {
    
    // show popup alert controller to request the Authorization of getting the location
    func configureLocationServices()  {
           if authorizationStatus == .notDetermined {
               locationManager.requestAlwaysAuthorization()
              centerMapOnMyLocation()
           } else {
               return
           }
       }
}
///////////////////////////////////////////////////////////////
extension MapKitVC {

    func fixLocation()  {
        
        // get my current location
        guard let location = location, !location.isEmpty else { return }
        // determination the space of the Comma in location string
        if location.contains(",") {
            let range: Range<String.Index> = location.range(of: ",")!
            let indexOfComma: Int = location.distance(from: location.startIndex, to: range.lowerBound)
            
            // take the latitude and longitude value from location string
            let latitude = Double(location[0..<indexOfComma])!
            let longitude = Double(location[(indexOfComma + 1)..<(location.count)])!
            
            defaultCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
        } else {
            // default coordibate that will appear if location camed from API is bot available (Not Found)
            defaultCoordinate = CLLocationCoordinate2D(latitude: 30.805081, longitude: 30.9952908)
        }
    }
}
///////////////////////////////////////////////////////////////////////////
//MARK: Make A Direction On mapView
extension MapKitVC {
    
    func makeADirection()  {
        
        guard let myLocation = locationManager.location?.coordinate else { return }
        
        let sourcePlaceMark = MKPlacemark(coordinate: myLocation)
        let destinationPlaceMark = MKPlacemark(coordinate: defaultCoordinate)
        
        let directionRequest = MKDirections.Request()
        //Source
        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
        //distination
        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
        //moving type
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (response, error) in
            guard let directionResonse = response else {
                if error != nil {
                    print("we have error getting directions : \(error?.localizedDescription)")
                }
                return
            }
            //routes[0] which means the shortest and best route
            let route = directionResonse.routes[0]
            self.MapKit.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.MapKit.setRegion(MKCoordinateRegion(rect), animated: true)
            
            
        }
    }
    
    // responsible for line details (Which will be drawing on the map)
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        renderer.lineWidth = 4.0
        return renderer
    }
    
}



