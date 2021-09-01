//
//  IModel.swift
//  TestApp
//
//  Created by Jackson  on 01.09.2021.
//

import Foundation

enum RError: Error {
    case jsonEncoding
    case dataEncoding
}

 protocol IModel: Codable, Hashable {
    init(data: Data) throws
    init(data: Data?) throws
    init(_ json: String, using encoding: String.Encoding) throws
    init(fromURL url: URL) throws
    func jsonData() throws -> Data
    func jsonString(encoding: String.Encoding) throws -> String?
 }

 extension IModel {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Self.self, from: data)
    }

    init(data: Data?) throws {
        guard let data = data else {
            throw RError.dataEncoding
        }

        self = try JSONDecoder().decode(Self.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw RError.jsonEncoding
        }

        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        let encoder = JSONEncoder()

        return try encoder.encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
 }
