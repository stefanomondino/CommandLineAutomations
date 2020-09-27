//
//  Strings.swift
//  App
//
//  Created by Stefano Mondino on 02/12/2019.
//  Copyright © 2019 Synesthesia. All rights reserved.
//

import Foundation

public protocol Translation: CustomStringConvertible {
    var key: String { get }
}

public extension Translation where Self: RawRepresentable, RawValue == String {
    var key: String { rawValue }
    var description: String { translation }
    func format(with arguments: String) -> String {
        String(format: description, arguments)
    }

    func format(with arguments: [String]) -> String {
        String(format: description, arguments)
    }
}
