//
//  ContactDetailsView.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 12/7/23.
//

import SwiftUI

struct ContactDetailsView: View {
    var contact: Contact
    var body: some View {
        Form {
                
            Image(data: contact.image)
                .resizable()
                .scaledToFill()
            .frame(width: 300, height: 300)
        }
        .navigationTitle(contact.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    ContactDetailsView()
//}
