//
//  MasterViewController.swift
//  VistasJerarquicas
//
//  Created by Daniel Suso Sánchez on 14/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var detailViewController: DetailViewController? = nil
    var books = [Book]()
    var managedObjectContext : NSManagedObjectContext? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        searchBar.hidden = true
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Obtenemos todos los libros en la base de datos
        let newBookEntity = NSEntityDescription.entityForName("Book", inManagedObjectContext: self.managedObjectContext!)
        let query = newBookEntity?.managedObjectModel.fetchRequestTemplateForName("getAllBooks")
        do {
            let bookEntities = try self.managedObjectContext?.executeFetchRequest(query!)
            self.books.removeAll()
            for bookEntity in bookEntities! {
                let imageData : NSData? = bookEntity.valueForKey("portada") as? NSData
                let book = Book(isbn: bookEntity.valueForKey("isbn") as! String,
                            autores: bookEntity.valueForKey("autores") as! String,
                            titulo: bookEntity.valueForKey("titulo") as! String,
                            portada: imageData != nil ? UIImage(data: imageData!) : nil)
                books.append(book)
            }
        }
        catch {
            
        }
        
        self.tableView.reloadData()
    }

    @IBAction func newSearch(sender: UIBarButtonItem) {
        
        searchBar.text = nil
        searchBar.hidden = false
        searchBar.becomeFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "searchSegue" {
            let detail = segue.destinationViewController as! DetailViewController
            detail.isSearch = true
            detail.isbn = (sender as! String)
            detail.master = self
        }
        else if segue.identifier == "detailSegue" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedBook = books[indexPath.row]
                let detail = segue.destinationViewController as! DetailViewController
                detail.isSearch = false
                detail.book = selectedBook
            }
        }
        else if segue.identifier == "detailSegue2" {
            let selectedBook = sender as! Book
            let detail = segue.destinationViewController as! DetailViewController
            detail.isSearch = false
            detail.book = selectedBook
        }
    }

    // MARK: - Table View

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Libros recientes"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = books[indexPath.row].titulo
        return cell
    }
    
    // MARK: - Search Bar    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        let isbn = searchBar.text
        
        searchBar.text = nil
        searchBar.hidden = true
        searchBar.resignFirstResponder()
        
        let bookEntity = self.getBookByISBN(isbn!)
        
        if (bookEntity == nil) {
            self.performSegueWithIdentifier("searchSegue", sender: isbn)
        }
        else {
            let imageData : NSData? = bookEntity!.valueForKey("portada") as? NSData
            let book = Book(isbn: bookEntity!.valueForKey("isbn") as! String,
                            autores: bookEntity!.valueForKey("autores") as! String,
                            titulo: bookEntity!.valueForKey("titulo") as! String,
                            portada: imageData != nil ? UIImage(data: imageData!) : nil)
            self.performSegueWithIdentifier("detailSegue2", sender: book)
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.hidden = true
        searchBar.resignFirstResponder()
    }
    
    internal func addBook(book: Book) {
        
        var bookEntity : NSManagedObject? = self.getBookByISBN(book.isbn)
        
        if (bookEntity == nil) {
            bookEntity = NSEntityDescription.insertNewObjectForEntityForName("Book", inManagedObjectContext: self.managedObjectContext!)
        }
        
        bookEntity!.setValue(book.titulo, forKey: "titulo")
        bookEntity!.setValue(book.autores, forKey: "autores")
        bookEntity!.setValue(book.isbn, forKey: "isbn")
        if (book.portada != nil) {
            bookEntity!.setValue(UIImagePNGRepresentation(book.portada!), forKey: "portada")
        }
        
        do {
            try self.managedObjectContext?.save()
        }
        catch {
            
        }
     }
    
    internal func getBookByISBN(isbn: String) -> NSManagedObject? {
        
        var bookEntity : NSManagedObject? = nil
        
        // Miramos si el libro ya existe en la base de datos para modificarlo o crear uno nuevo
        let newBookEntity = NSEntityDescription.entityForName("Book", inManagedObjectContext: self.managedObjectContext!)
        let query = newBookEntity?.managedObjectModel.fetchRequestFromTemplateWithName("getBookByISBN", substitutionVariables: ["isbn": isbn])
        do {
            let entity = try self.managedObjectContext?.executeFetchRequest(query!)
            if entity != nil && entity!.count > 0 {
                bookEntity = entity![0] as? NSManagedObject
            }
        }
        catch {
            
        }
        
        return bookEntity
    }
}

