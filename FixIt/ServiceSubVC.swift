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
        "Basin repair",
        "Bathroom",
        "Blocked drains",
        "Piping",
        "Taps",
        "Toilet",
        "Sprinklers",
        "Custom"
    ]
    let electricalArr = [
        "Fridge",
        "Lights",
        "Microwave",
        "Sockets",
        "Stove",
        "Wiring",
        "Custom"
    ]
    let carpentryArr = [
        "Cardboard",
        "Closet",
        "Counters",
        "Doors",
        "Waterproofing",
        "Custom"
    ]
    let flooringArr = [
        "Tiles",
        "Pavements",
        "Custom"
    ]
    let landscapeArr = [
        "Gardening",
        "Grass",
        "Custom"
    ]
    let cleaningArr = [
        "House cleaning",
        "House keeping",
        "Window cleaning",
        "Custom"
    ]
    let laundryArr = [
        "Beddings",
        "Curtains",
        "Linen",
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
    var selectedSubSet = Set<String>()
    var selectedRow = UITableViewCell ()
    var customRequest = ""
    var nxtBTN = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = passedClickedHomeService
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped))
        
        nxtBTN = navigationItem.rightBarButtonItem!
        nxtBTN.isEnabled = false
        
    }
    
//MARK: - TableView Data source methods
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
            cell.tag = indexPath.row
            cell.textLabel?.text = plumbingArr[indexPath.row]
        case "Electrical":
            cell.tag = indexPath.row
            cell.textLabel?.text = electricalArr[indexPath.row]
        case "Carpentry":
            cell.tag = indexPath.row
            cell.textLabel?.text = carpentryArr[indexPath.row]
        case "Flooring":
            cell.tag = indexPath.row
            cell.textLabel?.text = flooringArr[indexPath.row]
        case "Landscape":
            cell.tag = indexPath.row
            cell.textLabel?.text = landscapeArr[indexPath.row]
        case "Cleaning":
            cell.tag = indexPath.row
            cell.textLabel?.text = cleaningArr[indexPath.row]
        case "Laundry":
            cell.tag = indexPath.row
            cell.textLabel?.text = laundryArr[indexPath.row]
        default:
            cell.tag = indexPath.row
            cell.textLabel?.text = carWashArr[indexPath.row]
        }
        
        if cell.textLabel!.text == "Custom" {
            cell.layer.borderColor = #colorLiteral(red: 1, green: 0.6439015865, blue: 0.5808330774, alpha: 1)
            cell.layer.borderWidth = 1
        }
        
        
        return cell
    }
    

    
//MARK: - TableView Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        //handle check marks and custom request action
        
        selectedRow = tableView.cellForRow(at: indexPath)!
        
        switch selectedRow.textLabel!.text! {
        case "Custom":
            var alertText = UITextField ()
            
            let alert = UIAlertController(title: "Custom request", message: "Please type your custom request", preferredStyle: .alert)
            let action = UIAlertAction(title: "Submit", style: .default) { (alert) in
                
                self.customRequest = alertText.text ?? "What"
                //self.selectedRow.textLabel!.text! = "* \(self.customRequest)"
                
                switch self.customRequest {
                case "Custom":
                    self.customRequest = ""
                default:
                    self.nxtBTN.isEnabled = true
                }
                
                self.selectedRow.textLabel!.text! = self.customRequest
                self.selectedSubSet.insert(self.selectedRow.textLabel!.text!)
                
                self.selectedRow.accessoryType = .checkmark
                
                if self.customRequest == ""{
                    self.selectedRow.textLabel!.text! = "Custom"
                    self.selectedRow.accessoryType = .none
                    
                }
            }
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "My special request"
                alertText = alertTextField
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        default:
            if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
                tableView.cellForRow(at: indexPath)?.accessoryType = .none
                
            } else {
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
            
            
            switch selectedRow.accessoryType {
            case .checkmark:
                selectedSubSet.insert(selectedRow.textLabel!.text!)
            case .none:
                selectedSubSet.remove(selectedRow.textLabel!.text!)
            default:
                print ("error on selected subset")
            }
            
            
            if selectedSubSet.isEmpty == false {
                nxtBTN.isEnabled = true
            } else {
                nxtBTN.isEnabled = false
            }
        }

    }

    
//MARK: - Functions
    @objc func nextTapped(){
        //print("next navigation bar button")
        selectedSubSet.remove("")
        print("Category: \(title ?? "Error: Missing Category!")")
        print("Requested service: \(selectedSubSet)")
        
        //print("this is a custom request: \(customRequest)")
        //print(selectedCell)
    }
    
    
}
