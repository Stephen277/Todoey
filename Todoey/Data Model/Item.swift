//
//  Item.swift
//  Todoey
//
//  Created by Stephen Casar on 2018-07-13.
//  Copyright © 2018 Stephen Casar. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
