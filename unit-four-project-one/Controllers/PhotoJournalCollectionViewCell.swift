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
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var captionLabelOutlet: UILabel!
    @IBOutlet weak var dateLabelOutlet: UILabel!
    @IBOutlet weak var actionSheetButtonOutlet: UIButton!
    
    
    @IBAction func actionSheetButtonPressed(_ sender: UIButton) {
        delegate?.showActionSheet(tag: sender.tag)
    }
    
}
