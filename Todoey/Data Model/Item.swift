//
//  Item.swift
//  Todoey
//
//  Created by Stephen Casar on 2018-07-02.
//  Copyright © 2018 Stephen Casar. All rights reserved.
//

import Foundation

//class Item: Encodable, Decodable {    // can replace with codable
class Item: Codable {
    var title: String = ""
    var done: Bool = false
   
}
