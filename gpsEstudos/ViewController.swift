//
//  ViewController.swift
//  gpsEstudos
//
//  Created by Gabriel de Sousa Barbosa on 18/09/23.
//
import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController {
    
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        title = "Navegação do GPS"
        
        LocationManager.shared.getUserLocation{ [weak self] location in
            
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                strongSelf.addMapPin(whith: location)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.map.frame = view.bounds
    }
    
    
    
    func addMapPin(whith location: CLLocation) {
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
            map.setRegion(MKCoordinateRegion(center: location.coordinate,
                                              span: MKCoordinateSpan(
                                                latitudeDelta: 0.7,
                                                longitudeDelta: 0.7)),
                           animated: true)
        map.addAnnotation(pin)
    }
}

