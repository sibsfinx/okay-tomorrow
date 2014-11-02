//
//  ViewController.swift
//  OkayTomorrow
//
//  Created by Alexander Mescheryakov on 31.10.14.
//  Copyright (c) 2014 Alexander Mescheryakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource  {
    
    var tableView: UITableView!
    var textField: UITextField!
    var tableViewData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: CGRectMake(0, 100, self.view.bounds.width, self.view.bounds.height - 100), style: UITableViewStyle.Plain)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        self.textField = UITextField(frame: CGRectMake(0, 0, self.view.bounds.width, 100))
        self.textField.backgroundColor = UIColor(hue: 0.8, saturation: 0.1, brightness: 0.9, alpha: 1)
        self.textField.delegate = self
        
        self.view.addSubview(self.textField)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableViewData.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myNewCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        myNewCell.textLabel!.text = self.tableViewData[indexPath.row]
        
        return myNewCell
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        tableViewData.append(textField.text)
        textField.text = ""
        self.tableView.reloadData()
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
}
