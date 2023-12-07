//
//  AddContactView.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 11/30/23.
//

import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var name = ""
    @State private var showingImagePicker = false
    @Binding var contacts: [Contact]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedContacts")
    
    var body: some View {
        NavigationView {
            Form {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text("Tap to select a picture")
                        .foregroundStyle(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 300, height: 300)
                .onTapGesture { showingImagePicker = true }
                TextField("Name", text: $name)
            }
            .toolbar {
                Button("Save") {
                    save()
                    dismiss()
                }
                .disabled(isInvalidContact())
            }
            .navigationTitle("Add Contact")
            .onChange(of: inputImage) { loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func save() {
        guard let inputImage else { return }
        
        do {
            if let jpegData = inputImage.jpegData(compressionQuality: 0.8) {
                let newContact = Contact(id: UUID(), image: jpegData, name: name)
                contacts.append(newContact)
                
                let contactData = try JSONEncoder().encode(contacts)
                try contactData.write(to: savePath, options: [.atomic, .completeFileProtection])
            }
        } catch {
            print("Cannot save data")
        }
    }
    
    func isInvalidContact() -> Bool {
        return inputImage == nil || name.isEmpty
    }
}

//#Preview {
//    @State var contacts = [Contact]()
//    AddContactView(contacts: $contacts)
//}
