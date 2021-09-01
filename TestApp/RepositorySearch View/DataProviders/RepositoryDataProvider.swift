//
//  RepositoryDataProvider.swift
//  TestApp
//
//  Created by Jackson  on 01.09.2021.
//

import Foundation

protocol IRepositoryDataProvider {
    static func searchRepos(by name: String, completion: @escaping ([Repository]?) -> Void)
}

final class RepositoryDataProvider: IRepositoryDataProvider {
    static func searchRepos(by name: String, completion: @escaping ([Repository]?) -> Void) {
        Rest.get(urlString: "https://api.github.com/users/\(name)/repos", generalType: [Repository].self) { result in
            do {
                let repositories = try result.get()
                completion(repositories)
            } catch {
                completion(nil)
            }
        }
    }
}
