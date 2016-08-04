//
//  QuesoViewController.swift
//  Pizzas
//
//  Created by Daniel Suso Sánchez on 11/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController {

    var tamanho : String = ""
    var masa : String = ""
    var queso : String = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ingredientesSegue" {
            
            let destination : IngredientesViewController = segue.destinationViewController as! IngredientesViewController
            
            destination.tamanho = self.tamanho
            destination.masa = self.masa
            destination.queso = self.queso
        }
    }
    
    @IBAction func mozarela(sender: AnyObject) {
        
        self.queso = "Mozarela"
        self.performSegueWithIdentifier("ingredientesSegue", sender: sender)
    }
    @IBAction func cheddar(sender: AnyObject) {
        
        self.queso = "Cheddar"
        self.performSegueWithIdentifier("ingredientesSegue", sender: sender)
    }
    @IBAction func parmesano(sender: AnyObject) {
        
        self.queso = "Parmesano"
        self.performSegueWithIdentifier("ingredientesSegue", sender: sender)
    }
    @IBAction func sinQueso(sender: AnyObject) {
        
        self.queso = "Sin queso"
        self.performSegueWithIdentifier("ingredientesSegue", sender: sender)
    }
}
