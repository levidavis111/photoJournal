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
    //MARK: - Outlets
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        photoCollectionView.delegate = self
    }

}

extension PhotoJournalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoJournal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let 
        
        return UICollectionViewCell()
    }
    
    
}

extension PhotoJournalViewController: UICollectionViewDelegateFlowLayout {
    
}
