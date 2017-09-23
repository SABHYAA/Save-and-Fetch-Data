//
//  Coredata.swift
//  CoreDataDemo
//
//  Created by appinventiv on 21/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import  CoreData

class CoredataVc: UIViewController {
    var textFieldData = [String:String]()
    //-----------variable declaration-----//
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //-----------Outlets-------//
    @IBOutlet weak var firstnameTextfield: UITextField!
    @IBOutlet weak var secondnameTextfield: UITextField!
    @IBOutlet weak var searchbynameLabel: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    //-----------Button Actions--------//
    @IBAction func saveBtn(_ sender: UIButton){
        //----------To Save Data---------//
        textFieldData["firstname"] = self.firstnameTextfield!.text
        textFieldData["secondname"] = self.secondnameTextfield!.text
        CoreDataManagement().save(UserData: textFieldData)
        
    }
    //------------ Search The users-------------//
    @IBAction func searchBtn(_ sender: UIButton) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        let searchString = self.searchbynameLabel?.text
        request.predicate = NSPredicate(format: "firstname == %@" ,searchString!)
        
        do{
            let result = try context.fetch(request)
            if result.count > 0 {
                let firstname = (result[0] as AnyObject).value(forKey: "firstname") as! String
                let secondname = (result[0] as AnyObject).value(forKey: "secondname") as! String
                self.resultsLabel?.text = firstname + " " + secondname
            }
            else{
                self.resultsLabel?.text = "no user"
            }
            
        }
        catch {
            print(error)
        }
        
        
    }
    @IBAction func showallusersBtn(_ sender: UIButton) {
        let obj = self.storyboard?.instantiateViewController(withIdentifier: "UserId") as? UserVc
        self.navigationController?.pushViewController(obj!, animated: true)
        
    }
}
