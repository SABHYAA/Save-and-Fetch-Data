//
//  UserVc.swift
//  CoreDataDemo
//
//  Created by appinventiv on 21/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit
import CoreData

class UserVc: UIViewController {
    //--------------Variable Declaration---------//
    var userArray: [Users] = []
    //--------------Outlet-----------------//
    @IBOutlet weak var userTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTableview.delegate = self
        self.userTableview.dataSource = self
        
        userArray = CoreDataManagement().fetch()
        self.userTableview.reloadData()
    }
}
//----------------TableView Datasource And Delegates------------------//
extension UserVc: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! Custom
        
        let name = userArray[indexPath.row]
        
        cell.textLabel?.text = name.firstname! + "" + name.secondname! + ""
        
        return cell
    }
}
class  Custom: UITableViewCell {
    
}
