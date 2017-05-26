//
//  CheckInViewController.swift
//  Ufit
//
//  Created by ALEJANDRO on 24/05/17.
//  Copyright © 2017 AHA Universo. All rights reserved.
//

import UIKit
import Social

class CheckInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print ("Check in completado")
        
        // Insert check in in DB
    }
    
    // MARK: - MENÚ BUTTON
    
    @IBAction func mainMenu(sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }

    // MARK: - FACEBOOK SHARE
    
    @IBAction func facebookShare(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
            let url: URL = URL(string: "http://www.ufit.com.mx/")!
            let fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            fbShare.setInitialText("La evolución empieza en el interior. UFIT Evoluciona conmigo.")
            fbShare.add(url)
            self.present(fbShare, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Por favor inicia sesión en Facebook para compartir.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    // MARK: - TWITTER SHARE
    
    @IBAction func twitterShare(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let url: URL = URL(string: "http://www.ufit.com.mx/")!
            let twShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twShare.setInitialText("La evolución empieza en el interior. UFIT Evoluciona conmigo.")
            twShare.add(url)
            self.present(twShare, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Por favor inicia sesión en Twitter para compartir.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
