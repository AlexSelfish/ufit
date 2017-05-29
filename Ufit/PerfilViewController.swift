//
//  PerfilViewController.swift
//  ufit
//
//  Created by ALEJANDRO on 06/06/16.
//  Copyright © 2016 ahauniverso. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tablaPerfil: UITableView!
    
    var secciones = ["MI CUENTA", "ESTADOS DE CUENTA", "SERVICIOS CONECTADOS", "NOTIFICACIONES", "ACERCA DE"]
    
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
        print("Perfil Section")
    }
    
    // MARK: - MENÚ BUTTON
    
    @IBAction func mainMenu(sender: AnyObject) {
        self.revealViewController().revealToggle(animated: true)
    }
    
    // MARK: - TABLE METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.secciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaPerfil", for: indexPath)
        cell.textLabel?.text = "\(self.secciones[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    // MARK: - BEFORE NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detallePerfilSegue" ,
            let detallePerfilVC = segue.destination as? DetallePerfilViewController,
            let indexPath = self.tablaPerfil.indexPathForSelectedRow {
                detallePerfilVC.tituloTxt = self.secciones[indexPath.row]
            }
    }
    
    // MARK: - WARNINGS
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

