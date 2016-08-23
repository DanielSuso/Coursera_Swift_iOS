//
//  DetailViewController.swift
//  VistasJerarquicas
//
//  Created by Daniel Suso Sánchez on 14/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class Book {
    var autores : String
    var titulo : String
    var portada : UIImage?
    var isbn : String
    
    init(isbn: String,autores: String, titulo: String, portada: UIImage?) {
        
        self.isbn = isbn
        self.autores = autores
        self.titulo = titulo
        self.portada = portada
    }
}

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lbl_titulo: UILabel!
    @IBOutlet weak var lbl_autores: UILabel!
    @IBOutlet weak var iv_cover: UIImageView!
    @IBOutlet weak var lbl_cover: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var master : MasterViewController? = nil
    var isSearch: Bool = false
    var isbn : String? = nil
    var book : Book? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_autores.text = ""
        lbl_titulo.text = ""
        lbl_cover.hidden = true;
        iv_cover.image = nil;
        spinner.hidden = true;
        
        if isSearch && isbn != nil {
            self.title = "ISBN " + isbn!
            self.getBookByISBN(isbn!)
        }
        else if book != nil {
            self.title = "ISBN " + (book?.isbn)!
            self.showBookData()
        }
    }
    
    func showBookData() {
        
        lbl_titulo.text = book?.titulo
        lbl_autores.text = book?.autores
        if book?.portada != nil {
            self.iv_cover.image = book?.portada
            self.lbl_cover.hidden = false;
        }
    }
    
    func getBookByISBN(ISBN: String) {
        
        var autors : String = ""
        var title : String = ""
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:".stringByAppendingString(ISBN)
        let url = NSURL(string: urls.stringByReplacingOccurrencesOfString(" ", withString: ""))
        
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
                    book = Book(isbn: isbn!, autores: autors, titulo: title, portada: nil)
                
                    if isSearch && book != nil {
                        master?.addBook(self.book!)
                    }
                    
                    if let cover = dicoISBN["cover"] as! NSDictionary? {
                        if let coverImageURL = cover["large"] {
                            self.loadImageFromUrl(coverImageURL as! String)
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
    
    func loadImageFromUrl(url: String) {
        
        // Create Url from string
        let url = NSURL(string: url)!
        
        // Download task:
        spinner.startAnimating()
        spinner.hidden = false;
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (responseData, responseUrl, error) -> Void in
            // if responseData is not null...
            if let data = responseData{
                
                // execute in UI thread
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    let image = UIImage(data: data)
                    self.iv_cover.image = image
                    self.lbl_cover.hidden = false;
                    self.spinner.stopAnimating()
                    self.spinner.hidden = true;
                    self.book?.portada = image
                    if self.isSearch && self.book != nil {
                        self.master?.addBook(self.book!)
                    }
                })
            }
        }
        
        // Run task
        task.resume()
    }
}