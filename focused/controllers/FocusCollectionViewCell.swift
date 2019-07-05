//
//  FocusCollectionViewCell.swift
//  focused
//
//  Created by Jose Veliz on 7/4/19.
//  Copyright © 2019 Jose Veliz. All rights reserved.
//

import UIKit

class FocusCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    var item:Item?
    
    func update(item: Item){
        self.item = item
        
        nameLabel.text = item.title
        priorityLabel.text = String(item.priority)
    }
    
    @IBAction func doneAtTapped(_ sender: Any) {
        item?.doneat = NSDate()
        PersistanceService.saveContext()
    }
    
    @IBAction func discardTapped(_ sender: Any) {
        if let item = self.item {
            PersistanceService.context.delete(item)
            PersistanceService.saveContext()
        }
    }
    
}
