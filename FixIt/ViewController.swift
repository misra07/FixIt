//
//  ViewController.swift
//  FixIt
//
//  Created by Misra Ngonga on 2020/09/13.
//  Copyright © 2020 mvnBits. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var cleanEmail = ""
    var cleanPW = ""
    
    
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
        errorLabel.textColor = .red
        errorLabel.alpha = 0
        //*1
        userEmail.delegate = self
        userPassword.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //dismiss keyboard by touching outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //dismiss keyboard by hitting enter on keyboard *1
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldsCheck()
        textField.resignFirstResponder()
        
        return true
    }
    
    
    
    @IBAction func signInBTNCLicked(_ sender: Any) {
        textFieldsCheck()
        
        //sign in
        Auth.auth().signIn(withEmail: cleanEmail, password: cleanPW) { (result, error) in
            if error != nil {
                
                self.errorToast()
                self.errorLabel.text = error!.localizedDescription
            } else {
                //print ("YAY")
                /*let homeViewController = self.storyboard?.instantiateViewController(identifier: "ServicesVC") as ViewController?
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()*/
                
                //perform segue
                self.transitionToServices()
            }
        }
        
        userEmail.resignFirstResponder()
        userPassword.resignFirstResponder()
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
    
    
    func textFieldsCheck(){
        if (userEmail.text == ""){
            userEmail.layer.borderWidth = 1.5
            userEmail.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
            userEmail.layer.cornerRadius = 5
            errorToast()

        } else {
            cleanEmail = userEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        if (userPassword.text == ""){
            userPassword.layer.borderWidth = 1.5
            userPassword.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
            userPassword.layer.cornerRadius = 5
            errorToast()
        } else {
            cleanPW = userPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
    }
    
    func errorToast(){
        errorLabel.alpha = 1
        errorLabel.text = "Please fill in missing info"
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
            self.errorLabel.alpha = 0
            self.userEmail.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 0)
            self.userPassword.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 0)
        }
    }
    
    func transitionToServices() {
        
        /*let servicesViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.servicesViewController) as? ServicesVC
        
        view.window?.rootViewController = servicesViewController
        view.window?.makeKeyAndVisible()*/
        
        performSegue(withIdentifier: "showServices", sender: self)
        
    }

}
