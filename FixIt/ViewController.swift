//
//  ViewController.swift
//  FixIt
//
//  Created by Misra Ngonga on 2020/09/13.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let BGArr = [
        "BG1.jpg",
        "BG2.jpg",
        "BG3.jpg",
        "BG4.jpg",
        "BG5.jpg",
        "BG6.jpg",
        "BG7.jpg",
        "BG8.jpg",
        "BG9.jpg",
        "BG10.jpg",
        "BG11.jpg",
        "BG12.jpg",
        "BG13.jpg",
        "BG14.jpg",
        "BG15.jpg",
        "BG16.jpg",
        "BG17.jpg",
        "BG18.jpg",
        "BG19.jpg",
        "BG20.jpg",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setBG()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setBG(){
        let background = UIImage(named: BGArr.randomElement() ?? "BG1.jpg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
      }

}

