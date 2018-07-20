//
//  Category.swift
//  Todoey
//
//  Created by Stephen Casar on 2018-07-13.
//  Copyright © 2018 Stephen Casar. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var colour : String = ""
    let items = List<Item>()
}
