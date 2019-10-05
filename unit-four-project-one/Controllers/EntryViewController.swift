//
//  EntryViewController.swift
//  unit-four-project-one
//
//  Created by Levi Davis on 10/1/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit
import Photos

class EntryViewController: UIViewController {
    
    //MARK: - Local variables
    
    var image = UIImage() {
        didSet {
            entryImageView.image = image
        }
    }
    var photoAccessPermission = false
    
    var savedEntries = [Entry]()
    
    var entryText = String()
    
    //MARK: - Outlets
    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet weak var entryImageView: UIImageView!
    
    //MARK: - Override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTextView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    
    @IBAction func addNewPhotoButtonPressed(_ sender: Any) {
        getImageAccess()
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        if photoAccessPermission {
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Need PhotoPermission", message: "This app needs photo permission", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in
                self.photoAccessPermission = true
                self.present(imagePicker, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (alertAction) in
                self.photoAccessPermission = false
            }))
            self.present(alert, animated: true, completion: nil)

        }

    }
    
    @IBAction func saveEntryButtonPressed(_ sender: UIBarButtonItem) {
        createEntryObject()
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Private functions
    
    private func createEntryObject() {
        let imageData = self.image.pngData()
        if let imageToSet = self.image.pngData() {
            let newEntry = Entry(description: entryText, image: imageToSet)
            try? EntryPersistenceHelper.manager.save(newEntry: newEntry)
        } else {
            print("No data")
        }
    }
    
    private func getImageAccess() {
        let photolibrary = PHPhotoLibrary.authorizationStatus()
        
        switch photolibrary {
        case .authorized:
            self.photoAccessPermission = true
        case .denied:
            self.photoAccessPermission = false
            let alert = UIAlertController(title: "No photo library access", message: "Ha!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alertAction) in
                self.photoAccessPermission = true
            }))
            self.present(alert, animated: true, completion: nil)
        case.restricted:
            self.photoAccessPermission = false
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (permission) in
                switch permission {
                case .authorized:
                    self.photoAccessPermission = true
                case.denied:
                    self.photoAccessPermission = false
                case .restricted:
                    self.photoAccessPermission = false
                case .notDetermined:
                    print("error")
                default:
                    print("error")
                }
            }
        default:
            print("Hi")
        }
    }
    
    
}

extension EntryViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.entryTextView.text = ""
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
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
