//
//  CoreDataManagement.swift
//  CoreDataDemo
//
//  Created by appinventiv on 23/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation
import  UIKit
import  CoreData

class  CoreDataManagement {
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func save(UserData:[String:String]){
        
//        if firstnameTextfield?.text != "" && secondnameTextfield?.text != ""{
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newUser.setValue(UserData["firstname"], forKey: "firstname")
            newUser.setValue(UserData["secondname"], forKey: "secondname")
            do{
                try context.save()
            }
            catch{
                print(error)
            }
        
//        else {
//            print("please fill the first name and second name")
//        }
    }
        
    
    func fetch() -> [Users]{
         var userArray: [Users] = []
        
        do{
            userArray = try context.fetch(Users.fetchRequest())
        }
        catch{
            print(error)
        }
        return userArray
    }
    
}
