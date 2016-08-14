//
//  MasterViewController.swift
//  VistasJerarquicas
//
//  Created by Daniel Suso Sánchez on 14/8/16.
//  Copyright © 2016 Daniel Suso Sánchez. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    var detailViewController: DetailViewController? = nil
    var books = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.hidden = true
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
        self.performSegueWithIdentifier("searchSegue", sender: isbn)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.hidden = true
        searchBar.resignFirstResponder()
    }
    
    internal func addBook(book: Book) {
        
        for i in 0..<books.count {
            
            let b : Book = books[i]
            if b.isbn == book.isbn {
                
                books.removeAtIndex(i)
                break
            }
        }
        
        books.append(book)
     }
}

