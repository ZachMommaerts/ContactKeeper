//
//  ContentView.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 11/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var contacts = [Int]()
    @State private var showingImagePicker = false
    @State private var showingAddContactView = false
    
    var body: some View {
        NavigationView {
            List(contacts, id: \.self) { contact in
                
            }
            .navigationTitle("Contact Keeper")
            .toolbar{
                Button {
                    showingImagePicker = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .onChange(of: inputImage) { loadImage() }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .sheet(isPresented: $showingAddContactView, content: {
                AddContactView(image: image)
            })
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        showingAddContactView = true
    }
}

#Preview {
    ContentView()
}
