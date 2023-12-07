//
//  ContentView.swift
//  ContactKeeper
//
//  Created by Zach Mommaerts on 11/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var contacts = [Contact]()
    @State private var showingAddContactView = false
    
    var body: some View {
        NavigationView {
            List(contacts.sorted()) { contact in
                NavigationLink {
                    ContactDetailsView(contact: contact)
                } label: {
                    HStack {
                        Image(data: contact.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height: 50)
                        Text(contact.name)
                    }
                }
            }
            .navigationTitle("Contact Keeper")
            .toolbar{
                Button {
                    showingAddContactView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddContactView, content: {
                AddContactView(contacts: $contacts)
            })
            .onAppear(perform: loadContacts)
        }
    }
    
    func loadContacts() {
        do {
            let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedContacts")
            let contactData = try Data(contentsOf: savePath)
            contacts = try JSONDecoder().decode([Contact].self, from: contactData)
        } catch {
            contacts = []
        }
    }
}

#Preview {
    ContentView()
}
