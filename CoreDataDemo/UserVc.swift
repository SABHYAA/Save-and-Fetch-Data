//
//  UserVc.swift
//  CoreDataDemo
//
//  Created by appinventiv on 21/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import  CoreData

class UserVc: UIViewController {
    var userArray: [Users] = []
    
    @IBOutlet weak var userTableview: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.userTableview.delegate = self
        self.userTableview.dataSource = self
        self.fetchData()
        self.userTableview.reloadData()
    }
}
extension UserVc: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableview.dequeueReusableCell(withIdentifier: "CustomCellId", for: indexPath) as! CustomCell
        let name = userArray[indexPath.row]
        cell.textLabel?.text = name.firstname! + "" + name.secondname! + ""
        return cell
    }
    func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
          userArray = try context.fetch(Users.fetchRequest())
        }
        catch{
            print(error)
        }
        
        
    }
    
}
class  CustomCell: UITableViewCell {
    
   
}
