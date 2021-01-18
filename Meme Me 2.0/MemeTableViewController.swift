//
//  SentMemesTableViewController.swift
//  Meme Me 2.0
//
//  Created by Nathaniel Lema on 1/17/21.
//

import Foundation

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    @IBOutlet weak var flowLayout: UITableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
