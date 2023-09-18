//
//  LocationManager.swift
//  gpsEstudos
//
//  Created by Gabriel de Sousa Barbosa on 18/09/23.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping ((CLLocation) -> Void )) {
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    private func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        
        guard let location = locations.first else {
           return
        }
        completion?(location)
        manager.stopUpdatingLocation()
    }
}
