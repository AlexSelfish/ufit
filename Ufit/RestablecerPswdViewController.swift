//
//  RestablecerPswdViewController.swift
//  Ufit
//
//  Created by ALEJANDRO on 26/05/17.
//  Copyright © 2017 AHA Universo. All rights reserved.
//

import UIKit

class RestablecerPswdViewController: UIViewController {

    // MARK: - DID LOAD
    
    @IBOutlet var email: MyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.email.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        self.email.borderStyle = .none
        self.email.attributedPlaceholder = NSAttributedString(string:"E-mail", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
    }
    
    // MARK: - DID APPEAR
    
    override func viewDidAppear(_ animated: Bool) {
        print("Restablecer Contrasenia Section")
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
