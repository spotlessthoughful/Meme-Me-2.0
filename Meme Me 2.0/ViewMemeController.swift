//
//  ViewMemeController.swift
//  Meme Me 2.0
//
//  Created by Nathaniel Lema on 1/26/21.
//

import Foundation
import UIKit

class ViewMemeController: UIViewController {
    
    // Meme
    var meme: Meme!
    
    @IBOutlet weak var viewMemeImage: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewMemeImage.image = meme.memedImage
    }
}
