//
//  ViewController.swift
//  Hamburguesas
//
//  Created by Daniel Suso Sánchez on 3/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelPais: UILabel!
    @IBOutlet weak var labelHamburguesa: UILabel!
    
    let paises = ColeccionDePaises()
    let hamburguesas = ColeccionDeHamburguesas()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        cambiarPaisYHamburguesa()
    }
    
    @IBAction func pedirHamburguesa(sender: AnyObject) {
        
        self.cambiarPaisYHamburguesa()
    }
    
    func cambiarPaisYHamburguesa() {
    
        let pais = paises.obtenerPais()
        labelPais.text = pais
    
        let hamburguesa = hamburguesas.obtenerHamburguesa()
        labelHamburguesa.text = hamburguesa
    }
}

