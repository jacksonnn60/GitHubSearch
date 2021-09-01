//
//  Rest.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation

protocol RestProtocol {
    static func get< T: IModel > (urlString: String, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class Rest: RestProtocol {
    static func get< T: IModel > (urlString: String, generalType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {

        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in

            guard let data = data else {
                return
            }

            let result = Result {
                try JSONDecoder().decode(T.self, from: data)
            }
            completion(result)
        }
        task.resume()
    }
}
