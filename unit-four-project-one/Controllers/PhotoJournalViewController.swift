//
//  PhotoJournalViewController.swift
//  unit-four-project-one
//
//  Created by Levi Davis on 9/27/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class PhotoJournalViewController: UIViewController {
    //MARK: - Local variables
    var photoJournal = [Entry]() {
        didSet {
            photoCollectionView.reloadData()
        }
    }
    
    let cellSpacing:CGFloat = 5.0
    
    //MARK: - Outlets
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        loadJournal()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDelegates()
        loadJournal()
    }
    
    //MARK: - IBActions
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func callActionSheetButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let destroyAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
                                            // Respond to user selection of the action
        }
        let editAction = UIAlertAction(title: "Edit", style: .default) { (action) in
            print("hi")
        }
        let shareAction = UIAlertAction(title: "Share", style: .default) { (action) in
            print("hi")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                                            // Respond to user selection of the action
        }
        
       
        alert.addAction(destroyAction)
        alert.addAction(editAction)
        alert.addAction(shareAction)
        alert.addAction(cancelAction)
        
        
        self.present(alert, animated: true) {
            // The alert was presented
        }
    }
    
//    {
//        let alert = UIAlertController(title: "Need PhotoPermission", message: "This app needs photo permission", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in
//            self.photoAccessPermission = true
//            self.present(imagePicker, animated: true, completion: nil)
//        }))
//        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (alertAction) in
//            self.photoAccessPermission = false
//        }))
//        self.present(alert, animated: true, completion: nil)
//
//    }
    
    //MARK: - Private functions
    
    private func loadJournal() {
        
        do {
            let savedEntries = try EntryPersistenceHelper.manager.getEntries()
            self.photoJournal = savedEntries
        } catch {
            print(error)
            return
        }
        
    }
    private func setDelegates() {
        photoCollectionView.dataSource = self
    }

}

extension PhotoJournalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoJournal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoJournalCollectionViewCell {
            let oneEntry = photoJournal[indexPath.row]
            let image = UIImage(data: oneEntry.image)
            cell.photoImageView.image = image
            cell.captionLabelOutlet.text = oneEntry.description
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}

extension PhotoJournalViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 1
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: screenHeight * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
}
