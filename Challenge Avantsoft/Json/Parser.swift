//
//  Parser.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/23.
//
import Foundation

struct Parser {
    static func parseJson<T: Decodable>(url: URL) -> T? {
        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            let decoder = JSONDecoder()
            guard let value: T = try? decoder.decode(T.self, from: data) else {
                return nil
            }

            return value
        } catch {
            return nil
        }
    }
}

