//
//  DictTableViewController.swift
//  PlistToTable
//
//  Created by Andrew Belozerov on 18.03.17.
//  Copyright © 2017 Andrew Belozerov. All rights reserved.
//

import UIKit

struct Objects {  //Вспомогательная структура
    var sectionName : String!
    var sectionObjects : [String]!
}

class DictTableViewController: UITableViewController {

    var dataSource = [Objects]()
    var loadedData = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refractoring()
        print(loadedData)
    }
    
    private func refractoring() {
        for (key , value)  in loadedData {
            dataSource.append(Objects(sectionName: key as! String, sectionObjects: value as! [String]))
        }
    }
    
   // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].sectionObjects.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].sectionName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DictCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.section].sectionObjects[indexPath.row]
        return cell
    }
}
