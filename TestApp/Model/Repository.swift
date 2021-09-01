//
//  User.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation


// MARK: - Repository
struct Repository: IModel {
    let name: String
    let watchers: Int?
    let repositoryDescription: String?
    let owner: Owner
    let language: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case watchers = "watchers"
        case repositoryDescription = "description"
        case owner = "owner"
        case language = "language"
    }
}

// MARK: - Owner
struct Owner: IModel {
    let login: String
}

extension Array: IModel where Element: IModel {}
