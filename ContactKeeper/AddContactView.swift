//
//  AddContactView.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 11/30/23.
//

import SwiftUI

struct AddContactView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.secondary)
                
                Text("Tap to select a picture")
                    .foregroundStyle(.white)
                    .font(.headline)
                
                image?
                    .resizable()
                    .scaledToFit()
            }
            .onTapGesture { showingImagePicker = true }
            TextField("Name", text: $name)
        }
        .navigationTitle("Add Contact")
        .onChange(of: inputImage) { loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func save() {
        var newContact = Contact(image: image, name: name)
    }
}

#Preview {
    AddContactView()
}
