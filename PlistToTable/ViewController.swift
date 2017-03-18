//
//  ViewController.swift
//  PlistToTable
//
//  Created by Andrew Belozerov on 18.03.17.
//  Copyright © 2017 Andrew Belozerov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dictFromFile = NSDictionary()
    
    @IBOutlet weak var dalaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loadData(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "MyData", ofType: "plist")
        if let path = path {
            dictFromFile = (NSDictionary(contentsOfFile: path))!
            
            dalaLabel.text = "Данные загружены"
        }
    }
    
    @IBAction func showTable(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTableSegue" {
            let dtvc = segue.destination as! DictTableViewController
            dtvc.loadedData = dictFromFile
        }
    }
}

