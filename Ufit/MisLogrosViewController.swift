//
//  MisLogrosViewController.swift
//  ufit
//
//  Created by ALEJANDRO on 06/06/16.
//  Copyright © 2016 ahauniverso. All rights reserved.
//

import UIKit

class MisLogrosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionLogros: UICollectionView!
    
    // Array Logros
    var logros = ["logroUno", "logroDos"]
    
    
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
        print("Mis Logros Section")
    }
    
    // MARK: - MENÚ BUTTON
    
    @IBAction func mainMenu(sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
    
    // MARK: - COLLECTION VIEW METHODS
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.logros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
    }
    
    // MARK: - BEFORE NAVIGATION
    
    
    // MARK: - WARNINGS
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}



class LogrosCollectionViewCell: UICollectionViewCell {
    
}




