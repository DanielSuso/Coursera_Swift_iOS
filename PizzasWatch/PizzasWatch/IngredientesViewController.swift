//
//  IngredientesViewController.swift
//  Pizzas
//
//  Created by Daniel Suso Sánchez on 11/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController {

    var tamanho : String = ""
    var masa : String = ""
    var queso : String = ""
    var ingredientes : [String] = []
    
    @IBOutlet weak var switchJamon: UISwitch!
    @IBOutlet weak var switchPepperoni: UISwitch!
    @IBOutlet weak var switchPavo: UISwitch!
    @IBOutlet weak var switchSalchicha: UISwitch!
    @IBOutlet weak var switchAceituna: UISwitch!
    @IBOutlet weak var switchCebolla: UISwitch!
    @IBOutlet weak var switchPimiento: UISwitch!
    @IBOutlet weak var switchPinha: UISwitch!
    @IBOutlet weak var switchAnchoa: UISwitch!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "confirmacionSegue" {
            
            let destination : ConfirmacionViewController = segue.destinationViewController as! ConfirmacionViewController
            
            destination.tamanho = self.tamanho
            destination.masa = self.masa
            destination.queso = self.queso
            destination.ingredientes = self.ingredientes
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        ingredientes = []
        if identifier == "confirmacionSegue" {
            
            if switchJamon.on { ingredientes.append("Jamón") }
            if switchPepperoni.on { ingredientes.append("Pepperoni") }
            if switchPavo.on { ingredientes.append("Pavo") }
            if switchSalchicha.on { ingredientes.append("Salchicha") }
            if switchAceituna.on { ingredientes.append("Aceitunas") }
            if switchCebolla.on { ingredientes.append("Cebolla") }
            if switchPimiento.on { ingredientes.append("Pimiento") }
            if switchPinha.on { ingredientes.append("Piña") }
            if switchAnchoa.on { ingredientes.append("Anchoa") }
            
            if ingredientes.count == 0 {
                
                let alert = UIAlertController(title: "Aviso", message: "Debes seleccionar al menos 1 ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                return false
            }
            else if ingredientes.count > 5 {
                
                let alert = UIAlertController(title: "Aviso", message: "Máximo 5 ingredientes", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                return false
            }
        }
        
        return true
    }
}
