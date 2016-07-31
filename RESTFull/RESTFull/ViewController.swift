//
//  ViewController.swift
//  RESTFull
//
//  Created by Daniel Suso Sánchez on 31/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tv_response: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        self.getBookByISBN(textField.text!)
        
        return true;
    }
    
    func getBookByISBN(ISBN: String) {
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:".stringByAppendingString(ISBN)
        let url = NSURL(string: urls)
        
        do {
            let datos : NSData? = try NSData(contentsOfURL: url!, options: NSDataReadingOptions())
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            tv_response.text = texto! as String
        } catch {
            let alertController = UIAlertController(title: "Alerta", message:
                "Ha ocurrido un error obteniendo los datos, introduzca un ISBN válido o compruebe su conexión a Internet!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }


}

