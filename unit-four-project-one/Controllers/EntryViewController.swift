//
//  EntryViewController.swift
//  unit-four-project-one
//
//  Created by Levi Davis on 10/1/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    //MARK: - Local variables
    
    var image = UIImage() {
        didSet {
            entryImageView.image = image
        }
    }
    
    var entryText = String()
    
    //MARK: - Outlets
    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet weak var entryImageView: UIImageView!
    
    //MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    
    @IBAction func addNewPhotoButtonPressed(_ sender: Any) {
        print("hi")
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary

        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveEntryButtonPressed(_ sender: UIBarButtonItem) {
        createEntryObject()
    }
    
    
    private func createEntryObject() {
        let imageData = self.image.pngData()
        if let imageToSet = self.image.pngData() {
            let newEntry = Entry(description: entryText, image: imageToSet)
            try? EntryPersistenceHelper.manager.save(newEntry: newEntry)
        } else {
            print("No data")
        }
    }
    
}

extension EntryViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        self.entryText = textView.text ?? ""
    }
}

extension EntryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            //couldn't get image :(
            return
        }
        self.image = image
        dismiss(animated: true, completion: nil)
    }
}
