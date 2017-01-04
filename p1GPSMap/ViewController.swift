//
//  ViewController.swift
//  p1GPSMap
//
//  Created by Luís Miguel Coelho Jordão on 04/01/2017.
//  Copyright © 2017 Luís Miguel Coelho Jordão. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    @IBOutlet weak var lock: UISwitch!
    
    let lm = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        lm.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            lm.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            lm.delegate = self
            lm.startUpdatingLocation()
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !lock.isOn{
            let local = locations.last!.coordinate
            mapa.camera = MKMapCamera(lookingAtCenter: local, fromDistance: 500, pitch: 0, heading: 0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //mapa.zoo
    }

    @IBAction func onDeis(_ sender: Any) {
        let coordDeis = CLLocationCoordinate2D(latitude: 40.1924, longitude: -8.4128)
        let regiaoDEIS = MKCoordinateRegion(center: coordDeis, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        
        mapa.setRegion(regiaoDEIS, animated: true)
        
        let DEIS = MKPointAnnotation()
        
        DEIS.coordinate = coordDeis
        DEIS.title = "DEIS-ISEC"
        
        mapa.addAnnotation(DEIS)
    }

}

