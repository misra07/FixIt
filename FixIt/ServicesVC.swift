//
//  ServicesVC.swift
//  FixIt
//
//  Created by Misra Ngonga on 2020/09/17.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class ServicesVC: UIViewController {
    
    @IBAction func ElectricalBTN(_ sender: UIButton) {
        
        print("Electrical button tapped")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
}

