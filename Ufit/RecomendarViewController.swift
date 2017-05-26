//
//  RecomendarViewController.swift
//  ufit
//
//  Created by ALEJANDRO on 06/06/16.
//  Copyright © 2016 ahauniverso. All rights reserved.
//

import UIKit

class RecomendarViewController: UIViewController {

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
        print("Recomendar a un amigo Section")
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
