//
//  LoginViewController.swift
//  ufit
//
//  Created by ALEJANDRO on 29/08/16.
//  Copyright © 2016 ahauniverso. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var nombreUsuario: MyTextField!
    @IBOutlet var contrasena: MyTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.nombreUsuario.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        self.nombreUsuario.borderStyle = .none
        self.nombreUsuario.attributedPlaceholder = NSAttributedString(string:"Nombre de usuario", attributes:[NSForegroundColorAttributeName: UIColor.white])
        self.contrasena.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        self.contrasena.borderStyle = .none
        self.contrasena.attributedPlaceholder = NSAttributedString(string:"Contraseña", attributes:[NSForegroundColorAttributeName: UIColor.white])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


class MyTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
