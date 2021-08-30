//
//  User.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation

struct Repository: Codable {
    var name: String
    var owner: OwnerKey
}

struct OwnerKey: Codable {
    var login: String
}


