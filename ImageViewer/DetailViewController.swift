//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by Stivan Mersho on 2020-03-19.
//  Copyright © 2020 Stivan Mersho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // Code connecting the ImageView from the storyboard
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var totalImages: Int?
    var currentImagePos: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImagePos? += 1
        
        navigationItem.largeTitleDisplayMode = .never
        title = ("Picture \(currentImagePos!) of \(totalImages!)")
        
        // If we have a image available (value) load the image into the imageView
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    
    
}
