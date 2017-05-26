//
//  EntrenamientoLibreViewController.swift
//  Ufit
//
//  Created by ALEJANDRO on 25/05/17.
//  Copyright © 2017 AHA Universo. All rights reserved.
//

import UIKit

class EntrenamientoLibreViewController: UIViewController {

    @IBOutlet var miliseconds: UILabel!
    @IBOutlet var seconds: UILabel!
    @IBOutlet var minutes: UILabel!
    @IBOutlet var hours: UILabel!
    
    var milis = 0
    var sec = 0
    var min = 0
    var hrs = 0
    
    var timer = Timer()
    
    // MARK: - DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    // MARK: - DID APPEAR
    
    override func viewDidAppear(_ animated: Bool) {
        print("Entretenimiento Libre Section")
    }
    
    // MARK: - MENÚ BUTTON
    
    @IBAction func mainMenu(sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        self.timer.invalidate()
    }
    
    @IBAction func start(_ sender: Any) {
        self.timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.counter), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(_ sender: Any) {
        self.timer.invalidate()
        self.milis = 00
        self.miliseconds.text = "00"
    }
    
    func counter() {
        
        self.milis += 1
        if self.milis > 9{
            
            self.miliseconds.text = "\(self.milis)"
            if self.milis == 100 {
                
                self.milis = 0
                self.miliseconds.text = "00"
                
                self.sec += 1
                if self.sec > 9{
                    self.seconds.text = "\(self.sec)"
                
                    if self.sec == 60 {
                        self.sec = 0
                        self.seconds.text = "00"
                    
                        self.min += 1
                        if self.min > 9{
                            self.minutes.text = "\(self.min)"
                    
                            if self.min == 60 {
                                self.min = 0
                                self.minutes.text = "00"
                                
                                self.hrs += 1
                                if self.hrs > 9{
                                    self.hours.text = "\(self.hrs)"
                                }
                                else {
                                    self.hours.text = "0\(self.hrs)"
                                }
                            }
                        }
                        else {
                            self.minutes.text = "0\(self.min)"
                        }
                    }
                }
                else {
                    self.seconds.text = "0\(self.sec)"
                }
            }
        }
        else {
           self.miliseconds.text = "0\(self.milis)"
        }
    
    }
    
    // MARK: - WARNINGS
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
