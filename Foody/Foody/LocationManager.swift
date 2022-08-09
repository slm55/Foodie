//
//  LocationManager.swift
//  Foody
//
//  Created by Aslan Murat on 19.03.2022.
//

import CoreLocation
import Foundation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    
    var completion: ((CLLocation) -> Void)?
    
    public func getUserLocation(completion: @escaping (CLLocation) -> Void) {
        self.completion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
    public func resolveLocationName(with location: CLLocation, completion: @escaping ((String?)->Void)){
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current) {
            placemarks, error in
            guard let pm = placemarks?.first, error == nil else {
                return
            }
            
           var name = ""
            if let locality = pm.locality {
                name += locality
            }
            
            if let thoroughfare = pm.thoroughfare {
                name += ", " + thoroughfare
            }
            
            if let subThoroughfare = pm.subThoroughfare {
                name += " " + subThoroughfare
            }
            
            completion(name)
        }
    }
}
