//
//  FileManager.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 12/6/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
