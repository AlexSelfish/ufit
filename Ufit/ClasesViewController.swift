//
//  ClasesViewController.swift
//  ufit
//
//  Created by ALEJANDRO on 06/06/16.
//  Copyright © 2016 ahauniverso. All rights reserved.
//

import UIKit



class ClasesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // Array variable to store data -> Clases
    var dataClases: NSArray = []
    var clasesObj: [NSDictionary] = []

    // Table variable
    @IBOutlet var tablaClases: UITableView!
    
    var datosClases: [String] = ["TRX", "YOGA"]
    
    // MARK: - DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        getClases()
    }
    
    // MARK: - DID APPEAR
    
    override func viewDidAppear(_ animated: Bool) {
        print("Clases Section")
    }
    
    // MARK: - MENÚ BUTTON
    
    @IBAction func mainMenu(sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
    // MARK: - BEFORE NAVIGATION
    
    
    // MARK: - TABLE METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clasesObj.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return clasesCeldaAtIndexPath(indexPath: indexPath as NSIndexPath)
    }
    
    func clasesCeldaAtIndexPath(indexPath:NSIndexPath) -> ClasesCeldaTableCell {
        let celda = tablaClases.dequeueReusableCell(withIdentifier: "celdaClasesId") as! ClasesCeldaTableCell
        //celda.imagenClase.image = UIImage(named:"\(datosClases[indexPath.row]).jpg")
        celda.tituloClase.text = self.clasesObj[indexPath.row]["Nombre"] as? String
        return celda
    }
    
    // MARK: - PREPARE NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detalleClase" ,
//            let detalleVC = segue.destination as? DetalleClaseViewController,
//            let indexPath = self.tablaClases.indexPathForSelectedRow {
//                let selectedClase = self.clasesObj[indexPath.row]
//                    //detalleVC.titulo.text = selectedClase["Nombre"]
//                    //nextScene.currentVehicle = selectedVehicle
//            }
//        }
    }
    
    // MARK: - GET DATA WEB SERVICE / CLASES
    
    func getClases(){
        let url = NSURL(string: "http://ufit-api.royalws.com/api/clases") //Provided JSON data on server
        let request = NSMutableURLRequest(url: url! as URL)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data,response,error in
            guard error == nil && data != nil else{
                print("Error: ",error!)
                return
            }
            let httpStatus = response as? HTTPURLResponse
            if httpStatus!.statusCode == 200 {
                if data?.count != 0 {
                    let responseString = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray //because JSON data started with Array
                    
                    // Asign response to NSDictionary
                    self.clasesObj = (responseString as? [NSDictionary])!
                    
                    DispatchQueue.main.sync{
                        // Reload table to show info
                        self.tablaClases.reloadData()
                    }
                }
                else{
                    print("No data got from url!")
                }
            }
        }
        task.resume()
    }
    
    
    // MARK: - WARNINGS
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


class ClasesCeldaTableCell: UITableViewCell{
    @IBOutlet var imagenClase: UIImageView!
    @IBOutlet var tituloClase: UILabel!
}
