//
//  ImageExtension.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 12/7/23.
//

import Foundation
import SwiftUI

extension Image {

    public init(data: Data?) {
        guard let data = data,
          let uiImage = UIImage(data: data) else {
            self = Image(systemName: "person.fill")
            return
        }
        self = Image(uiImage: uiImage)
    }
}
