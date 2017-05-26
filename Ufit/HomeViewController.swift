//
//  HomeViewController.swift
//  ufit
//
//  Created by ALEJANDRO on 06/06/16.
//  Copyright © 2016 ahauniverso. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var menuButton: UIButton!
    var locationmanager: CLLocationManager!
    @IBOutlet var checkinButton: UIButton!
    
    // MARK: - DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-50
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.locationmanager = CLLocationManager()
        self.locationmanager.delegate = self
        self.locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationmanager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation = locations[locations.count - 1]
        let UfitLocation = CLLocation(latitude: 20.7106696, longitude: -103.417546)
        let distanceBetween: CLLocationDistance = UfitLocation.distance(from: latestLocation)
        //print(distanceBetween)
        if distanceBetween > 5000 {
            self.checkinButton.isEnabled = false
        }
        else{
            self.checkinButton.isEnabled = true
        }
    }
    
    // MARK: - DID APPEAR
    
    override func viewDidAppear(_ animated: Bool) {
        print("Home Section")
        self.locationmanager.startUpdatingLocation()
    }
    
    // MARK: - MENÚ BUTTON
     
    @IBAction func mainMenu(sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
    // MARK: - BEFORE NAVIGATION
    

    // MARK: - WARNINGS
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
