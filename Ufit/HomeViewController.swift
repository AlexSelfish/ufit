//
//  HomeViewController.swift
//  ufit
//
//  Created by ALEJANDRO on 06/06/16.
//  Copyright © 2016 ahauniverso. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate, UIScrollViewDelegate{

    // MAIN VARS
    @IBOutlet var menuButton: UIButton!
    
    // CHECKIN - CLLOCATION VARS
    var locationmanager: CLLocationManager!
    @IBOutlet var checkinButton: UIButton!
    
    // HOME SCROLL VARS
    @IBOutlet var homeScroll: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet var loader: UIActivityIndicatorView!
    
    // MARK: - DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-50
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Init Home Scroll
        self.homeScroll.isPagingEnabled = true
        self.homeScroll.showsHorizontalScrollIndicator = false
        self.homeScroll.minimumZoomScale = 1.0
        self.homeScroll.maximumZoomScale = 1.0
        
        // Set Home Scroll
        setGallery()
        
        // Init Location Services
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
    
    // MARK: - SET HOME SCROLL
    func setGallery(){
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        self.homeScroll.contentSize = CGSize(width: screenWidth*4, height: screenHeight)
        self.pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        
        for i in 0 ... 3 {

            let ix = CGFloat(i)
            let imgView = UIImageView(frame: CGRect(x: screenWidth*ix, y: 0, width: screenWidth, height: screenHeight))
            
            if let checkedUrl = URL(string: "http://alejandrosantamaria.com.mx/temp/slider\(i).png") {
                imgView.contentMode = .scaleAspectFit
                self.loader.isHidden = false
                self.loader.startAnimating()
                downloadImage(url: checkedUrl, imageViewTemp: imgView)
            }
            self.homeScroll.addSubview(imgView)
            
            self.pageControl.numberOfPages = i+1
            self.pageControl.currentPage = 0
            self.pageControl.tintColor = UIColor.red
            self.pageControl.pageIndicatorTintColor = UIColor.white
            self.pageControl.currentPageIndicatorTintColor = UIColor.init(colorLiteralRed: 221/255, green: 252/255, blue: 52/255, alpha: 1)
            self.view.addSubview(pageControl)
        }
    }
    
    // Changing Page
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * self.homeScroll.frame.size.width
        self.homeScroll.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }

    
    // Get data from URL
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    // Download image
    func downloadImage(url: URL, imageViewTemp: UIImageView) {
        print("Download Image Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                imageViewTemp.image = UIImage(data: data)
                self.loader.stopAnimating()
                self.loader.isHidden = true
            }
        }
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
    }

    // MARK: - WARNINGS
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
