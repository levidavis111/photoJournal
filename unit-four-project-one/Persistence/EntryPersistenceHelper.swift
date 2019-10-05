//
//  EntryPersistenceHelper.swift
//  unit-four-project-one
//
//  Created by Levi Davis on 10/1/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct EntryPersistenceHelper {
    static let manager = EntryPersistenceHelper()
    
    func save(newEntry: Entry) throws {
        try persistenceHelper.save(newElement: newEntry)
    }
    
    func getEntries() throws -> [Entry] {
        return try persistenceHelper.getObjects()
    }
    
   func delete(element: [Entry], atIndex: Int) throws {
    try persistenceHelper.delete(element: element, index: atIndex)
    

    }
    
    
    private let persistenceHelper = PersistenceHelper<Entry>(fileName: "entries.plist")
    private init(){}
}


//struct PhotoPersistenceHelper {
//    static let manager = PhotoPersistenceHelper()
//
//    func save(newPhoto: Photo) throws {
//        try persistenceHelper.save(newElement: newPhoto)
//    }
//
//    func getPhotos() throws -> [Photo] {
//        return try persistenceHelper.getObjects()
//    }
//
//    private let persistenceHelper = PersistenceHelper<Photo>(fileName: "photos.plist")
//    private init() {}
//}
