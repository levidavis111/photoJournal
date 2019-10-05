//
//  Protocol.swift
//  unit-four-project-one
//
//  Created by Levi Davis on 10/5/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

protocol PhotoJournalCellDelegate: AnyObject {
    func showActionSheet(tag: Int)
}
