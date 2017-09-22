//
//  Coredata.swift
//  CoreDataDemo
//
//  Created by appinventiv on 21/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import  CoreData

class Coredata: UIViewController {
    //-----------variable declaration-----//
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //-----------Outlets-------//
    @IBOutlet weak var firstnameTextfield: UITextField!
    @IBOutlet weak var secondnameTextfield: UITextField!
    @IBOutlet weak var searchbynameLabel: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    //-----------Button Actions--------//
    @IBAction func saveBtn(_ sender: UIButton) {
        if firstnameTextfield?.text != "" && secondnameTextfield?.text != ""{
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newUser.setValue(self.firstnameTextfield!.text, forKey: "firstname")
            newUser.setValue(self.secondnameTextfield!.text, forKey: "secondname")
            do{
                try context.save()
            }
            catch{
                print(error)
            }
        }
        else {
            print("please fill the first name and second name")
        }
    }
    @IBAction func searchBtn(_ sender: UIButton) {
        
        
    }
    @IBAction func showallusersBtn(_ sender: UIButton) {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "UserId") as? UserVc
        self.navigationController?.pushViewController(obj!, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
}
