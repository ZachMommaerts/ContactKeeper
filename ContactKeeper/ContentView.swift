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
            List(contacts) { contact in
                
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
                AddContactView()
            })
        }
    }
}

#Preview {
    ContentView()
}
