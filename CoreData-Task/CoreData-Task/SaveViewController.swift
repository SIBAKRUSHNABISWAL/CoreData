//
//  SaveViewController.swift
//  CoreData-Task
//
//  Created by Siba on 09/03/20.
//  Copyright © 2020 Mobiotics. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveActionButton(_ sender: Any) {
        if nameTextField.text == String() {
            let nameTextFieldAlert = UIAlertController(title: "Name", message: "Please Enter Name", preferredStyle: .alert)
            nameTextFieldAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
            }))
            self.present(nameTextFieldAlert, animated: true, completion: nil)
        } else if countryTextField.text == String() {
            let countryTextFieldAlert = UIAlertController(title: "Country", message: "Please Enter Your Country Name", preferredStyle: .alert)
            countryTextFieldAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                
            }))
            self.present(countryTextFieldAlert, animated: true, completion: nil)
            
        } else {
            CoreDataManager.shared.saveData(name: nameTextField.text ?? "", countryName: countryTextField.text ?? "")
            nameTextField.text = ""
            countryTextField.text = ""
        }
    }
}
