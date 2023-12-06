//
//  Contact.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 12/5/23.
//

import Foundation
import SwiftUI

struct Contact: Comparable, Identifiable {
    let id = UUID()
    var image: Image?
    var name: String
    
    static func <(lhs: Contact, rhs: Contact) -> Bool {
            lhs.name < rhs.name
    }
}
