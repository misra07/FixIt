//
//  ServicesVC.swift
//  FixIt
//
//  Created by Misra Ngonga on 2020/09/17.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class ServicesVC: UIViewController {
    
    var homeServicesArr = ["Plumbing", "Electrical", "Carpentry", "Flooring", "Landscape", "Cleaning", "Laundry", "Car Wash"]
    var clickedHomeService = ""

    @IBAction func homeServiceSelected(_ sender: UIButton) {
        
        //clickedHomeService = String(sender.tag)
        clickedHomeService = homeServicesArr[sender.tag]
        performSegue(withIdentifier: "showServiceSub", sender: clickedHomeService)
        
        //print(clickedHomeService, "screen1")
    }
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: - Prepare for segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showServiceSub" {
            
            let destVC = segue.destination as! ServiceSubVC
            destVC.passedClickedHomeService =  clickedHomeService as String
          
        }
    }
}


