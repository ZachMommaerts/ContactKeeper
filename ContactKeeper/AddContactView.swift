//
//  AddContactView.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 11/30/23.
//

import SwiftUI

struct AddContactView: View {
    var image: Image?
    @State private var name = ""
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            TextField("Name", text: $name)
        }
    }
}

#Preview {
    AddContactView(image: Image("ales-krivec-15949"))
}
