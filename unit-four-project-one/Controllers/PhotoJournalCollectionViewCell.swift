//
//  PhotoJournalCollectionViewCell.swift
//  unit-four-project-one
//
//  Created by Levi Davis on 9/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class PhotoJournalCollectionViewCell: UICollectionViewCell {
     weak var delegate: PhotoJournalCellDelegate?
   
//    var position = Int()
//    var photoJournal = try? EntryPersistenceHelper.manager.getEntries()
    
//    @IBAction func actionButtonPressed(_ sender: UIButton) {
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//              let destroyAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
//                try? EntryPersistenceHelper.manager.delete(element: self.photoJournal!, atIndex: self.position)
//
//
//
//              }
//              let editAction = UIAlertAction(title: "Edit", style: .default) { (action) in
//                  print("hi")
//              }
//              let shareAction = UIAlertAction(title: "Share", style: .default) { (action) in
//                  print("hi")
//              }
//
//              let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
//                                                  // Respond to user selection of the action
//              }
//
//
//              alert.addAction(destroyAction)
//              alert.addAction(editAction)
//              alert.addAction(shareAction)
//              alert.addAction(cancelAction)
//
//
//
//
//    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var captionLabelOutlet: UILabel!
    @IBOutlet weak var dateLabelOutlet: UILabel!
    @IBOutlet weak var actionSheetButtonOutlet: UIButton!
    
    
    @IBAction func actionSheetButtonPressed(_ sender: UIButton) {
        delegate?.showActionSheet(tag: sender.tag)
        print("HI")
    }
    
}
