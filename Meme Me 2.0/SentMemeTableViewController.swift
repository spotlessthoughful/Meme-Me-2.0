//
//  SentMemesTableViewController.swift
//  Meme Me 2.0
//
//  Created by Nathaniel Lema on 1/17/21.
//

import Foundation

import UIKit

class SentMemeTableViewController: UITableViewController {
    
    private let cellreuseIdentifier = "TableViewCell"
    private let viewMemeControllerIdentifier = "ViewMemeController"
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellreuseIdentifier, for: indexPath)
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.imageView?.image = meme.memedImage
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meme = self.memes[(indexPath as NSIndexPath).row]
        let viewMemeController = self.storyboard!.instantiateViewController(identifier: viewMemeControllerIdentifier) as ViewMemeController
        viewMemeController.meme = meme
        
        self.navigationController!.pushViewController(viewMemeController, animated: true)
    }
}
