//
//  IngredientesController.swift
//  PizzasWatch
//
//  Created by Daniel Suso Sánchez on 7/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {

    @IBOutlet var sw_jamon: WKInterfaceSwitch!
    @IBOutlet var sw_pepperoni: WKInterfaceSwitch!
    @IBOutlet var sw_pavo: WKInterfaceSwitch!
    @IBOutlet var sw_salchicha: WKInterfaceSwitch!
    @IBOutlet var sw_aceituna: WKInterfaceSwitch!
    @IBOutlet var sw_cebolla: WKInterfaceSwitch!
    @IBOutlet var sw_pimiento: WKInterfaceSwitch!
    @IBOutlet var sw_pinha: WKInterfaceSwitch!
    @IBOutlet var sw_anchoa: WKInterfaceSwitch!
    @IBOutlet var lb_error: WKInterfaceLabel!
    
    var configuracionPizza : ConfiguracionPizza? = nil
    var numIngredientes : Int = 0
    var switchJamon : Bool = false
    var switchPepperoni : Bool = false
    var switchPavo : Bool = false
    var switchSalchicha : Bool = false
    var switchAceituna : Bool = false
    var switchCebolla : Bool = false
    var switchPimiento : Bool = false
    var switchPinha : Bool = false
    var switchAnchoa : Bool = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        configuracionPizza = context as? ConfiguracionPizza
        
        numIngredientes = 0
        lb_error.setHidden(true)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func switchJamonChange(value: Bool) {
    
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchJamon = value
    }
    
    @IBAction func switchPepperoniChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchPepperoni = value
    }
    
    @IBAction func switchPavoChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchPavo = value
    }
    
    @IBAction func switchSalchichaChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchSalchicha = value
    }
    
    @IBAction func switchAceitunaChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchAceituna = value
    }
    
    @IBAction func switchCebollaChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchCebolla = value
    }
    
    @IBAction func switchPimientoChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchPimiento = value
    }
    
    @IBAction func switchPinhaChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchPinha = value
    }
    
    @IBAction func switchAnchoaChange(value: Bool) {
        
        if value {
            numIngredientes += 1
        }
        else {
            numIngredientes -= 1
        }
        
        switchAnchoa = value
    }
    
    @IBAction func seleccionar() {
     
        var ingredientes : [String] = []
        
        if switchJamon { ingredientes.append("Jamón") }
        if switchPepperoni { ingredientes.append("Pepperoni") }
        if switchPavo { ingredientes.append("Pavo") }
        if switchSalchicha { ingredientes.append("Salchicha") }
        if switchAceituna { ingredientes.append("Aceitunas") }
        if switchCebolla { ingredientes.append("Cebolla") }
        if switchPimiento { ingredientes.append("Pimiento") }
        if switchPinha { ingredientes.append("Piña") }
        if switchAnchoa { ingredientes.append("Anchoa") }
        
        if numIngredientes == 0 {
            
            lb_error.setText("¡Debes seleccionar al menos 1 ingrediente!")
            lb_error.setHidden(false)
        }
        else if numIngredientes > 5 {
            
            lb_error.setText("¡Máximo 5 ingredientes!")
            lb_error.setHidden(false)
        }
        else {
            
            let configuracion = ConfiguracionPizza(tamanho: configuracionPizza!.tamanho, masa: configuracionPizza!.masa, queso: configuracionPizza!.queso, ingredientes: ingredientes)
            pushControllerWithName("ConfirmacionController", context: configuracion)
            lb_error.setHidden(true)
        }
    }

}
