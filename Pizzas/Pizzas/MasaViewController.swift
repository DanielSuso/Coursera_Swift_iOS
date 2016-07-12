//
//  MasaViewController.swift
//  Pizzas
//
//  Created by Daniel Suso Sánchez on 11/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController {

    var tamanho : String = ""
    var masa : String = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "quesoSegue" {
            
            let destination : QuesoViewController = segue.destinationViewController as! QuesoViewController
            
            destination.tamanho = self.tamanho
            destination.masa = self.masa
        }
    }
    
    @IBAction func delgada(sender: AnyObject) {
        
        self.masa = "Delgada"
        self.performSegueWithIdentifier("quesoSegue", sender: sender)
    }
    
    @IBAction func crujiente(sender: AnyObject) {
    
        self.masa = "Crujiente"
        self.performSegueWithIdentifier("quesoSegue", sender: sender)
    }
    
    @IBAction func gruesa(sender: AnyObject) {
        
        self.masa = "Gruesa"
        self.performSegueWithIdentifier("quesoSegue", sender: sender)
    }
}
