//
//  ViewController.swift
//  ImageViewer
//
//  Created by Stivan Mersho on 2020-03-19.
//  Copyright © 2020 Stivan Mersho. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadImages()
        
        // Button for giving an alert with information
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(infoAlert))
    }
    
    // Loading images from the folder inside the project.
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path).sorted()
        
        for item in items {
            if item.hasPrefix("image") {
                // Find the pictures matching the prefix and add them
                // to the array
                pictures.append(item)
            }
        }
    }
    
    // Rertun same amount of rows as the length of the picture-array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // Changing the height of each cell inside the tableView
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // When first row isn't visible anymore, it get removed and another row gets addded
        // at the bottom.
        // Good for ram management etc
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        // The name of the picture
        cell.textLabel?.text = pictures[indexPath.row]
        
        // Find each image and add it to the cell so it shows on the tableView
        let image: UIImage = UIImage(named: pictures[indexPath.row])!
        cell.imageView?.image = image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView")
            as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.totalImages = pictures.count
            vc.currentImagePos = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    // Alert for showing information when button "info" is pressed
    @objc func infoAlert() {
        let alert = UIAlertController(title: "Information", message: "These images are from Unsplash. I don't take any credit for the images. They are used for learning purpose only", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

