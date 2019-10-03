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
