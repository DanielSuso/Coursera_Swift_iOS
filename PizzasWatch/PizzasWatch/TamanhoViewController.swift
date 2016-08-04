//
//  TamanhoViewController.swift
//  Pizzas
//
//  Created by Daniel Suso Sánchez on 11/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class TamanhoViewController: UIViewController {
    
    var tamanho : String = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "masaSegue" {
            
            let destination : MasaViewController = segue.destinationViewController as! MasaViewController
            
            destination.tamanho = self.tamanho
        }
    }
    
    @IBAction func chica(sender: AnyObject) {
        
        self.tamanho = "Chica"
        self.performSegueWithIdentifier("masaSegue", sender: sender)
    }
    
    @IBAction func mediana(sender: AnyObject) {
        
        self.tamanho = "Mediana"
        self.performSegueWithIdentifier("masaSegue", sender: sender)
    }
    
    @IBAction func grande(sender: AnyObject) {
        
        self.tamanho = "Grande"
        self.performSegueWithIdentifier("masaSegue", sender: sender)
    }
    
    
}
