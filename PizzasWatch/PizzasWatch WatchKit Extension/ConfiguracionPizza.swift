//
//  ConfiguracionPizza.swift
//  PizzasWatch
//
//  Created by Daniel Suso Sánchez on 7/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import WatchKit

class ConfiguracionPizza: NSObject {

    var tamanho: String = ""
    var masa: String = ""
    var queso: String = ""
    var ingredientes: [String] = []
    
    init(tamanho: String, masa: String, queso: String, ingredientes: [String]) {
        self.tamanho = tamanho
        self.masa = masa
        self.queso = queso
        self.ingredientes = ingredientes
    }
}
