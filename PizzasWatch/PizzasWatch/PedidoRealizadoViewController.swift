//
//  PedidoRealizadoViewController.swift
//  PizzasWatch
//
//  Created by Mutlicanal3 on 4/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class PedidoRealizadoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
    }

    @IBAction func nuevoPedido(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}
