//
//  DetailViewController.swift
//  Project1
//
//  Created by Henrique Bersani on 11/28/20.
//  Copyright © 2020 Henrique Bersani. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
 var selectedImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage.image = UIImage(named: selectedImage)
        
//MARK: TopRightButton- NavigationItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    //   MARK:UIActivityViewController
    //    Our image view may or may not have an image inside, so we’ll read it out safely and convert it to JPEG
    //     iOS method of sharing content with other apps and services

   @objc func shareTapped(){
        guard let image = myImage.image?.jpegData(compressionQuality: 0.8) else {
        print("No image found")
        return
    }
     let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    @IBOutlet weak var myImage: UIImageView!
//    
    
 

}
