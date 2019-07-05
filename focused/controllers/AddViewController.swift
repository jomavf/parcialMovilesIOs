//
//  AddViewController.swift
//  focused
//
//  Created by Jose Veliz on 7/4/19.
//  Copyright © 2019 Jose Veliz. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var descripcionLabel: UITextField!
    @IBOutlet weak var urlLabel: UITextField!
    @IBOutlet weak var priorityLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        let newItem = Item(context: PersistanceService.context)
        newItem.id = UUID()
        newItem.title = titleLabel.text
        newItem.descripcion = titleLabel.text
        newItem.urlimage = urlLabel.text
        newItem.priority = Int16(priorityLabel.text!)!
        newItem.createdat = NSDate()
//        newItem.doneat = NSDate()
        PersistanceService.saveContext()
        
//        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//        if let listItems = mainStoryBoard.instantiateViewController(withIdentifier: "focusedItems") as? FocusViewController {
//            self.present(listItems, animated: true, completion: nil)
//        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
