//
//  ConfirmacionController.swift
//  PizzasWatch
//
//  Created by Daniel Suso Sánchez on 7/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionController: WKInterfaceController {

    @IBOutlet var lb_resumen: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let configuracionPizza = context as! ConfiguracionPizza
        
        var stringIngredientes : String = ""
        for i in 0 ..< configuracionPizza.ingredientes.count {
            
            if (i < configuracionPizza.ingredientes.count-1) {
                
                stringIngredientes += "\(configuracionPizza.ingredientes[i]), "
            }
            else {
                
                stringIngredientes += "\(configuracionPizza.ingredientes[i])."
            }
        }
        
        let resumen : String = "Tamaño: \(configuracionPizza.tamanho) \n Masa: \(configuracionPizza.masa) \n Queso: \(configuracionPizza.queso) \n Ingredientes: \(stringIngredientes)"
        lb_resumen.setText(resumen)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
