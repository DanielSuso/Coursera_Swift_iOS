//
//  ViewController.swift
//  RESTFull
//
//  Created by Daniel Suso Sánchez on 31/7/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lbl_titulo: UILabel!
    @IBOutlet weak var lbl_autores: UILabel!
    @IBOutlet weak var iv_cover: UIImageView!
    @IBOutlet weak var lbl_cover: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.hidden = true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        self.getBookByISBN(textField.text!)
        
        return true;
    }
    
    func getBookByISBN(ISBN: String) {
        
        lbl_autores.text = ""
        lbl_titulo.text = ""
        lbl_cover.hidden = true;
        iv_cover.image = nil;

        var autors : String = ""
        var title : String = ""
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:".stringByAppendingString(ISBN)
        let url = NSURL(string: urls)
        
        do {
            if let data = NSData(contentsOfURL: url!) {
                
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves)
                let dicoBook = json as! NSDictionary
                if let dicoISBN = dicoBook["ISBN:"+ISBN] as! NSDictionary? {
                    title = dicoISBN["title"] as! NSString as String
                    let dicoAutors = dicoISBN["authors"] as! NSArray
                    for autor in dicoAutors {
                        if autors.isEmpty {
                            autors += (autor["name"] as! String)
                        }
                        else {
                            autors += ", " + (autor["name"] as! String)
                        }
                    }
                    lbl_titulo.text = title
                    lbl_autores.text = autors
                    
                    if let cover = dicoISBN["cover"] as! NSDictionary? {
                        if let coverImageURL = cover["large"] {
                            self.loadImageFromUrl(coverImageURL as! String, view: iv_cover)
                        }
                    }
                }
                else {
                    self.showFailDialog()
                }
            }
            else {
                self.showFailDialog()
            }
        } catch {
            self.showFailDialog()
        }
    }
    
    func showFailDialog() {
        let alertController = UIAlertController(title: "Alerta", message:
            "Ha ocurrido un error obteniendo los datos, introduzca un ISBN válido o compruebe su conexión a Internet!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func loadImageFromUrl(url: String, view: UIImageView) {
    
        // Create Url from string
        let url = NSURL(string: url)!
        
        // Download task:
        // - sharedSession = global NSURLCache, NSHTTPCookieStorage and NSURLCredentialStorage objects.
        spinner.startAnimating()
        spinner.hidden = false;
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    view.image = UIImage(data: data)
                    self.lbl_cover.hidden = false;
                    self.spinner.stopAnimating()
                    self.spinner.hidden = true;
                })
            }
        }
        
        // Run task
        task.resume()
    }

}

