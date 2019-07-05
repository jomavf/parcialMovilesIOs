//
//  FocusViewController.swift
//  focused
//
//  Created by Jose Veliz on 7/4/19.
//  Copyright © 2019 Jose Veliz. All rights reserved.
//

import UIKit
import CoreData

class FocusViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var items:[Item] = []
    var currentRow = 0
    
    @IBOutlet weak var collectionViewController: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewController.delegate = self
        collectionViewController.dataSource = self
        
        let fetchRequest:NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            self.items = try PersistanceService.context.fetch(fetchRequest)
            self.items = self.items.filter { (item) -> Bool in
                if(item.doneat == nil) {
                    return true
                } else {
                    return false
                }
            }
            self.collectionViewController.reloadData()
        } catch {
            print("Mi error:\(error)")
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "focusCell", for: indexPath) as! FocusCollectionViewCell
        cell.update(item: items[indexPath.row])
        return cell
    }
    
    //Current row que presionas
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        currentRow = indexPath.item
//        self.collectionViewController.reloadData()
//        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
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
