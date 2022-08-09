//
//  MapViewController.swift
//  Foody
//
//  Created by Aslan Murat on 27.01.2022.
//
import MapKit
import UIKit

class MapViewController: UIViewController {
    private let map: MKMapView = {
        let map = MKMapView()
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Map"
        view.addSubview(map)
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                strongSelf.addMapPin(with: location)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: (tabBarController?.tabBar.frame.maxY ?? 0) - view.safeAreaInsets.top)
    }
    
    func addMapPin(with location: CLLocation){
        let pin = MKPointAnnotation()
        pin.coordinate = location.coordinate
        map.setRegion(MKCoordinateRegion(center: location.coordinate,
                                                    span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)),
                                 animated: true)
        map.addAnnotation(pin)
        
        LocationManager.shared.resolveLocationName(with: location) {
            [weak self] locationName in
            self?.navigationItem.title = locationName
        }
    }
    
}
