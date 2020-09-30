//
//  ServiceSubVC.swift
//  FixIt
//
//  Created by Misra Ngonga on 2020/09/21.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit

class ServiceSubVC: UITableViewController {
   
    var passedClickedHomeService = ""
    
    let plumbingArr = [
        "Toilet",
        "Bathroom",
        "Taps",
        "Piping",
        "Sprinklers",
        "Custom"
    ]
    let electricalArr = [
        "Lights",
        "Wiring",
        "Custom"
    ]
    let carpentryArr = [
        "Roofing",
        "Cardboards",
        "Closet",
        "Counters",
        "Custom"
    ]
    let flooringArr = [
        "Tiles",
        "Pavements",
        "Custom"
    ]
    let landscapeArr = [
        "Grass",
        "Gardening",
        "Custom"
    ]
    let cleaningArr = [
        "House cleaning",
        "Custom"
    ]
    let laundryArr = [
        "Curtains",
        "Beddings",
        "Custom"
    ]
    let carWashArr = [
        "Sedan",
        "Hatchback",
        "4x4",
        "Bakkie",
        "4x2",
        "Custom"
    ]
    
    var selectedSub = "uninitiated"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = passedClickedHomeService
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped))
        
    }
    
//MARK - TableView Data source methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return plumbingArr.count
        switch passedClickedHomeService {
        case "Plumbing":
            return plumbingArr.count
        case "Electrical":
            return electricalArr.count
        case "Carpentry":
            return carpentryArr.count
        case "Flooring":
            return flooringArr.count
        case "Landscape":
            return landscapeArr.count
        case "Cleaning":
            return cleaningArr.count
        case "Laundry":
            return laundryArr.count
        default:
            return carWashArr.count
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "servicesSubCell", for: indexPath)
        
        switch passedClickedHomeService {
        case "Plumbing":
            cell.textLabel?.text = plumbingArr[indexPath.row]
        case "Electrical":
            cell.textLabel?.text = electricalArr[indexPath.row]
        case "Carpentry":
            cell.textLabel?.text = carpentryArr[indexPath.row]
        case "Flooring":
            cell.textLabel?.text = flooringArr[indexPath.row]
        case "Landscape":
            cell.textLabel?.text = landscapeArr[indexPath.row]
        case "Cleaning":
            cell.textLabel?.text = cleaningArr[indexPath.row]
        case "Laundry":
            cell.textLabel?.text = laundryArr[indexPath.row]
        default:
            cell.textLabel?.text = carWashArr[indexPath.row]
        }
        
        //details cell info icon
        switch String(cell.textLabel!.text!){
        case "Custom":
            cell.accessoryType = .detailButton
            
        default:
            cell.accessoryType = .none
        }
        return cell
    }
    

//MARK - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //print(tableView.cellForRow(at: indexPath)!.textLabel!.text!)
        
        
        //handle check marks and custom request action
        switch tableView.cellForRow(at: indexPath)!.textLabel!.text! {
        case "Custom":
            print("present custom request alert")
        default:
            if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
            } else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
                
            }
            
            //submitting checked items
            if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                selectedSub = tableView.cellForRow(at: indexPath)!.textLabel!.text!
            } else {
                selectedSub = "everything deselected selected"
            }
        }
    }

    
    
    @objc func nextTapped(){
        //print("next navigation bar button")
        print("XXX \(selectedSub)")
        
    }
    
    
}
