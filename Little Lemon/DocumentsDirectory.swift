//
//  DocumentsDirectory.swift
//  Little Lemon
//
//  Created by Nick Pavlov on 4/2/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
