//
//  SentMemesCollectionViewController.swift
//  Meme Me 2.0
//
//  Created by Nathaniel Lema on 1/17/21.
//
import Foundation

import UIKit

class SentMemeCollectionViewController: UICollectionViewController {
    
    let memeCellReuseIdentifier = "memeCollectionViewCell"
    private let viewMemeControllerIdentifier = "ViewMemeController"
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: memeCellReuseIdentifier, for: indexPath) as! SentMemeCollectionViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memeImageView.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meme = self.memes[(indexPath as NSIndexPath).row]
        let viewMemeController = self.storyboard!.instantiateViewController(identifier: viewMemeControllerIdentifier) as! ViewMemeController
        viewMemeController.meme = meme
        self.navigationController!.pushViewController(viewMemeController, animated: true)
    }
}
