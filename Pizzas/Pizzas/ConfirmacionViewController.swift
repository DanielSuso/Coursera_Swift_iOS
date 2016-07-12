//
//  ConfirmacionViewController.swift
//  Pizzas
//
//  Created by Daniel Suso Sánchez on 11/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController {

    var tamanho : String = ""
    var masa : String = ""
    var queso : String = ""
    var ingredientes : [String] = []
    
    @IBOutlet weak var labelTamanho: UILabel!
    @IBOutlet weak var labelMasa: UILabel!
    @IBOutlet weak var labelQueso: UILabel!
    @IBOutlet weak var labelIngredientes: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        labelTamanho.text = "Tamaño: \(tamanho)"
        labelMasa.text = "Masa: \(masa)"
        labelQueso.text = "Queso: \(queso)"
        
        var stringIngredientes : String = "Ingredientes: "
        for i in 0 ..< self.ingredientes.count {
            
            if (i < self.ingredientes.count-1) {
                
                stringIngredientes += "\(self.ingredientes[i]), "
            }
            else {
                
                stringIngredientes += " y \(self.ingredientes[i])."
            }
        }
        
        labelIngredientes.text = stringIngredientes
    }
}
