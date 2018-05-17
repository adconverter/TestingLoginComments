//
//  Post.swift
//  AlamofireTest
//
//  Created by Руслан Федорович on 13.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import Foundation
import Unbox
struct Post: Codable {
    var datePublic: String?
    var id: Int?
    var text: String?
    var title: String?
}
extension Post: Unboxable {
    init(unboxer: Unboxer) throws {
        self.datePublic = try unboxer.unbox(key: "datePublic")
        self.id = try unboxer.unbox(key: "id")
        self.text = try unboxer.unbox(key: "text")
        self.title = try unboxer.unbox(key: "title")
    }
}

struct User {
    var name: String
    var password: String
}
